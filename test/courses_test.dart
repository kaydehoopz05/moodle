import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moodle/views/courses_view.dart';
import 'package:moodle/views/ds_course_view.dart';
 
void main() {
  Widget buildTestable() {
    return const MaterialApp(
      home: CoursesView(),
    );
  }
 
  testWidgets('renders heading and a card for every enrolled module',
      (tester) async {
    await tester.pumpWidget(buildTestable());
 
    expect(find.text('My Modules & Courses'), findsWidgets);
    expect(find.text('Enrolled modules'), findsOneWidget);
 
    // One card per module in the hardcoded list.
    expect(find.text('Database Systems'), findsOneWidget);
    expect(find.text('Algorithms and Structures'), findsOneWidget);
    expect(find.text('Programming Fundamentals'), findsOneWidget);
    expect(find.text('Software Engineering'), findsOneWidget);
    expect(find.text('Operating Systems'), findsOneWidget);
  });
 
  testWidgets('each module card shows its code and school', (tester) async {
    await tester.pumpWidget(buildTestable());
 
    expect(find.text('M234'), findsOneWidget);
    expect(find.text('M235'), findsOneWidget);
    expect(find.text('M236'), findsOneWidget);
    expect(find.text('M237'), findsOneWidget);
    expect(find.text('M238'), findsOneWidget);
 
    // "School of Computing" appears once per card (5 modules total).
    expect(find.text('School of Computing'), findsNWidgets(5));
  });
 
  testWidgets(
      'tapping a card with a destination navigates to DSCourseView',
      (tester) async {
    await tester.pumpWidget(buildTestable());
 
    await tester.tap(find.text('Database Systems'));
    await tester.pumpAndSettle();
 
    expect(find.byType(DSCourseView), findsOneWidget);
    expect(find.byType(CoursesView), findsNothing);
  });
 
  testWidgets(
      'tapping a card without a destination does not navigate away',
      (tester) async {
    await tester.pumpWidget(buildTestable());
 
    await tester.tap(find.text('Algorithms and Structures'));
    await tester.pumpAndSettle();
 
    // No destinationBuilder was provided for this module, so the app
    // should stay on CoursesView instead of navigating anywhere.
    expect(find.byType(CoursesView), findsOneWidget);
    expect(find.byType(DSCourseView), findsNothing);
  });
}
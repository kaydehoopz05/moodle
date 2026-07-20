import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:moodle/main.dart';

void main() {
  testWidgets('App renders dashboard and courses screen correctly',
      (WidgetTester tester) async {
    // Set desktop screen size
    tester.view.physicalSize = const Size(1200, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    // Build our app and trigger a frame.
    await tester.pumpWidget(const MoodleApp());

    // Verify that Dashboard title exists.
    expect(find.text('Dashboard'), findsNWidgets(2));

    // Open drawer
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pumpAndSettle();

    // Navigate to My Courses in drawer
    await tester.tap(find.text('My courses'));
    await tester.pumpAndSettle();

    // Verify Courses page contains course and module information
    expect(find.text('Computer Science 101'), findsOneWidget);
    expect(find.text('Programming Fundamentals'), findsOneWidget);
  });
}

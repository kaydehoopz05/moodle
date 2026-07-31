// Widget tests for LoginView.
//
// Place this file at: test/login_view_test.dart
// Run with: flutter test test/login_view_test.dart
//
// These tests exercise the widget in isolation (wrapped in a MaterialApp)
// rather than the whole app, so they don't depend on routing setup
// elsewhere in the project.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:moodle/views/login_view.dart';
import 'package:moodle/views/dashboard_view.dart';

void main() {
  // Wraps LoginView in a MaterialApp so Navigator/Theme/etc. are available.
  Widget buildTestable() {
    return const MaterialApp(
      home: LoginView(),
    );
  }

  group('LoginView - rendering', () {
    testWidgets('renders logo, heading, both fields, and login button',
        (tester) async {
      await tester.pumpWidget(buildTestable());

      expect(find.text('Log in to access your moodle'), findsOneWidget);
      expect(find.widgetWithText(TextField, 'University Email'), findsNothing);
      // Labels are set via InputDecoration.labelText, so look for the text
      // rendered by the decoration instead of TextField content.
      expect(find.text('University Email'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.byType(TextField), findsNWidgets(2));
      expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);

      // No error message should be visible initially.
      expect(
        find.text('Incorrect email or password. Please try again.'),
        findsNothing,
      );
    });

    testWidgets('password field obscures its text', (tester) async {
      await tester.pumpWidget(buildTestable());

      final passwordField = tester.widget<TextField>(
        find.byType(TextField).at(1),
      );

      expect(passwordField.obscureText, isTrue);
    });

    testWidgets('email field does not obscure its text', (tester) async {
      await tester.pumpWidget(buildTestable());

      final emailField = tester.widget<TextField>(
        find.byType(TextField).at(0),
      );

      expect(emailField.obscureText, isFalse);
    });
  });

  group('LoginView - validation', () {
    testWidgets('shows error message when credentials are incorrect',
        (tester) async {
      await tester.pumpWidget(buildTestable());

      await tester.enterText(
        find.byType(TextField).at(0),
        'wrong@myport.ac.uk',
      );
      await tester.enterText(find.byType(TextField).at(1), 'wrongpassword');
      await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
      await tester.pump();

      expect(
        find.text('Incorrect email or password. Please try again.'),
        findsOneWidget,
      );
      // Should remain on LoginView, not navigate away.
      expect(find.byType(LoginView), findsOneWidget);
      expect(find.byType(DashboardView), findsNothing);
    });

    testWidgets('shows error message when fields are left empty',
        (tester) async {
      await tester.pumpWidget(buildTestable());

      await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
      await tester.pump();

      expect(
        find.text('Incorrect email or password. Please try again.'),
        findsOneWidget,
      );
    });

    testWidgets('shows error when email is correct but password is wrong',
        (tester) async {
      await tester.pumpWidget(buildTestable());

      await tester.enterText(
        find.byType(TextField).at(0),
        'up2246840@myport.ac.uk',
      );
      await tester.enterText(find.byType(TextField).at(1), 'wrongpassword');
      await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
      await tester.pump();

      expect(
        find.text('Incorrect email or password. Please try again.'),
        findsOneWidget,
      );
    });

    testWidgets('trims leading/trailing whitespace from the email field',
        (tester) async {
      await tester.pumpWidget(buildTestable());

      await tester.enterText(
        find.byType(TextField).at(0),
        '  up2246840@myport.ac.uk  ',
      );
      await tester.enterText(find.byType(TextField).at(1), 'money');
      await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
      await tester.pumpAndSettle();

      // Whitespace should be trimmed, so this should still succeed
      // and navigate to the dashboard.
      expect(find.byType(DashboardView), findsOneWidget);
    });

    testWidgets('does not trim whitespace from the password field',
        (tester) async {
      await tester.pumpWidget(buildTestable());

      await tester.enterText(
        find.byType(TextField).at(0),
        'up2246840@myport.ac.uk',
      );
      await tester.enterText(find.byType(TextField).at(1), ' money ');
      await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
      await tester.pump();

      // Password is compared without trimming, so extra whitespace
      // should cause a failed login.
      expect(
        find.text('Incorrect email or password. Please try again.'),
        findsOneWidget,
      );
    });
  });

  group('LoginView - successful login', () {
    testWidgets('navigates to DashboardView with correct credentials',
        (tester) async {
      await tester.pumpWidget(buildTestable());

      await tester.enterText(
        find.byType(TextField).at(0),
        'up2246840@myport.ac.uk',
      );
      await tester.enterText(find.byType(TextField).at(1), 'money');
      await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
      await tester.pumpAndSettle();

      expect(find.byType(DashboardView), findsOneWidget);
      expect(find.byType(LoginView), findsNothing);
    });

    testWidgets('login is case-sensitive on email and password',
        (tester) async {
      await tester.pumpWidget(buildTestable());

      await tester.enterText(
        find.byType(TextField).at(0),
        'UP2246840@MYPORT.AC.UK',
      );
      await tester.enterText(find.byType(TextField).at(1), 'MONEY');
      await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
      await tester.pump();

      // Exact match required, so differently-cased credentials should fail.
      expect(
        find.text('Incorrect email or password. Please try again.'),
        findsOneWidget,
      );
    });
  });
}
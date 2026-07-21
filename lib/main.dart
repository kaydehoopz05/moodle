import 'package:flutter/material.dart';
import 'package:moodle/constants.dart';
import 'package:moodle/views/assessments_view.dart';

import 'package:moodle/views/calendar_view.dart';
import 'package:moodle/views/courses_view.dart';
import 'package:moodle/views/dashboard_view.dart';
import 'package:moodle/views/profile_page_view.dart';
import 'package:moodle/views/notification_view.dart';

void main() {
  runApp(const MoodleApp());
}

class MoodleApp extends StatelessWidget {
  const MoodleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moodle',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: moodlePurple,
          primary: moodlePurple,
          secondary: moodleSecondary,
          surface: moodleSurface,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const DashboardView(),
        '/calendar': (context) => const CalendarView(),
        '/courses': (context) => const CoursesView(),
        '/assessments': (context) => const AssessmentsView(),
        '/profile': (context) => const ProfilePageView(),
        '/notifications': (context) => const NotificationView(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

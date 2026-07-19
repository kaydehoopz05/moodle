import 'package:flutter/material.dart';
import 'package:moodle/constants.dart';
import 'package:moodle/views/courses_view.dart';
import 'package:moodle/views/dashboard_view.dart';
import 'package:moodle/views/profile_page_view.dart';

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
        '/courses': (context) => const CoursesView(),
        '/profile': (context) => const ProfilePageView(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:moodle/widgets/nav_drawer.dart';
import 'package:moodle/constants.dart';
import 'package:moodle/views/profile_page_view.dart';

class NotificationView extends StatelessWidget {
  const NotificationView ({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: moodleWhite,
        foregroundColor: moodleTextDark,
        elevation: 1,
        toolbarHeight: 76,
        titleSpacing: 0,
        leadingWidth: 56,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
            title : Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/');
                    },
                    child: Container(
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(
                        color: moodleGrayBg,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset(
                        'images/moodle_logo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/');
                        },
                        child: const Text(
                          'Dashboard',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: moodlePurple,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/courses');
                        },
                        child: const Text(
                          'My Courses',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: moodlePurple,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/assessments');
                        },
                        child: const Text(
                          'My Assessments',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: moodlePurple,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
            ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:moodle/widgets/nav_drawer.dart';
import 'package:moodle/constants.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({Key? key}) : super(key: key);

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
        title: Row(
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
            const Text(
              'Calendar',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: moodlePurple,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_none_outlined),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
            child: const CircleAvatar(
              radius: 18,
              backgroundColor: moodleGrayBg,
              foregroundColor: moodlePurple,
              child: Text(
                'YH',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      drawer: const NavDrawer(),
      body: Container(
        color: moodleBg,
        child: ListView(
          padding: const EdgeInsets.all(24.0),
          children: [
            const Text(
              'Academic calendar',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: moodlePurple,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Your upcoming events and deadlines in one place.',
              style: TextStyle(fontSize: 15, color: moodleTextDark),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: moodleWhite,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: moodleBorder),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'No events scheduled yet.',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: moodleTextDark,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Check back later to see your course deadlines and academic events.',
                    style: TextStyle(fontSize: 14, color: moodleTextMuted),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

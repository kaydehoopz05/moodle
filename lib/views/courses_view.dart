import 'package:flutter/material.dart';
import 'package:moodle/widgets/nav_drawer.dart';
import 'package:moodle/constants.dart';

class CoursesView extends StatelessWidget {
  const CoursesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final courses = [
      const _CourseData(
        title: 'Computer Science 101',
        subtitle: 'Semester 1 • Lecturer: Dr. A. Chen',
        modules: [
          _ModuleData(
            title: 'Programming Fundamentals',
            detail: 'Week 3 • 2 activities due today',
          ),
          _ModuleData(
            title: 'Algorithms and Structures',
            detail: 'Week 4 • Quiz available',
          ),
        ],
      ),
      const _CourseData(
        title: 'Mathematics for Computing',
        subtitle: 'Semester 1 • Lecturer: Prof. T. Lewis',
        modules: [
          _ModuleData(
            title: 'Discrete Mathematics',
            detail: 'Week 2 • Practice set open',
          ),
          _ModuleData(
            title: 'Statistics and Probability',
            detail: 'Week 5 • Recorded lecture ready',
          ),
        ],
      ),
    ];

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
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  child: const Text(
                    'Dashboard',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
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
                      fontSize: 18,
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
                      fontSize: 18,
                      color: moodlePurple,
                    ),
                  ),
                ),
              ],
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
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline),
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
              'My courses',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: moodlePurple,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Here are the modules you are currently enrolled in across your courses.',
              style: TextStyle(fontSize: 15, color: moodleTextDark),
            ),
            const SizedBox(height: 24),
            ...courses.map((course) => Card(
                  color: moodleWhite,
                  elevation: 0,
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: moodleBorder),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF2EFFF),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(
                                Icons.school_outlined,
                                color: moodlePurple,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    course.title,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: moodleTextDark,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    course.subtitle,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: moodleTextMuted,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        const Text(
                          'Enrolled modules',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: moodlePurple,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ...course.modules.map((module) => Container(
                              margin: const EdgeInsets.only(bottom: 8),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: moodleBg,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          module.title,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: moodleTextDark,
                                          ),
                                        ),
                                        const SizedBox(height: 3),
                                        Text(
                                          module.detail,
                                          style: const TextStyle(
                                            fontSize: 13,
                                            color: moodleTextMuted,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: moodleWhite,
                                      borderRadius: BorderRadius.circular(999),
                                      border: Border.all(color: moodleBorder),
                                    ),
                                    child: const Text(
                                      'Active',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: moodlePurple,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class _CourseData {
  final String title;
  final String subtitle;
  final List<_ModuleData> modules;

  const _CourseData({
    required this.title,
    required this.subtitle,
    required this.modules,
  });
}

class _ModuleData {
  final String title;
  final String detail;

  const _ModuleData({required this.title, required this.detail});
}

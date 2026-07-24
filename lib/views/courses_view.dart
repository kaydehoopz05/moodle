import 'package:flutter/material.dart';
import 'package:moodle/widgets/nav_drawer.dart';
import 'package:moodle/constants.dart';

class CoursesView extends StatelessWidget {
  const CoursesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final modules = [
      const _ModuleData(
        code: "M234",
        school: "School of Computing",
        title: 'Programming Fundamentals',
      ),
      const _ModuleData(
        code: "M234",
        school: "School of Computing",
        title: 'Algorithms and Structures',
      ),
      const _ModuleData(
        code: "M234",
        school: "Database Systems",
        title: 'Programming Fundamentals',
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 480;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: moodleWhite,
            foregroundColor: moodleTextDark,
            elevation: 1,
            toolbarHeight: isCompact ? 64 : 76,
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
                isCompact
                    ? Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: moodleGrayBg,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.asset(
                          'images/moodle_logo.png',
                          fit: BoxFit.contain,
                        ),
                      )
                    : GestureDetector(
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
                const SizedBox(width: 8),
                if (isCompact)
                  const Expanded(
                    child: Text(
                      'My courses',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: moodlePurple,
                      ),
                    ),
                  )
                else
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
            actions: isCompact
                ? [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/profile');
                      },
                      child: const CircleAvatar(
                        radius: 18,
                        backgroundColor: moodleGrayBg,
                        foregroundColor: moodlePurple,
                        child: Text(
                          'KD',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                  ]
                : [
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
                          'KD',
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
              padding: EdgeInsets.all(isCompact ? 16.0 : 24.0),
              children: [
                Text(
                  'My courses',
                  style: TextStyle(
                    fontSize: isCompact ? 22 : 28,
                    fontWeight: FontWeight.bold,
                    color: moodlePurple,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Here are the modules you are currently enrolled in across your courses.',
                  style: TextStyle(fontSize: 15, color: moodleTextDark),
                ),
                SizedBox(height: isCompact ? 16 : 24),
                Text(
                  'Enrolled modules',
                  style: TextStyle(
                    fontSize: isCompact ? 16 : 18,
                    fontWeight: FontWeight.bold,
                    color: moodleTextDark,
                  ),
                ),
                const SizedBox(height: 16),
                ...modules.map((module) => Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: EdgeInsets.all(isCompact ? 12 : 16),
                      decoration: BoxDecoration(
                        color: moodleWhite,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: moodleBorder),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  module.code,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: isCompact ? 14 : 16,
                                    color: moodleTextDark,
                                  ),
                                ),
                                Text(
                                  module.school,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: isCompact ? 14 : 16,
                                    color: moodleTextDark,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  module.title,
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: moodleTextMuted,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: moodleBg,
                              borderRadius: BorderRadius.circular(999),
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
        );
      },
    );
  }
}

class _ModuleData {
  final String code;
  final String school;
  final String title;

  const _ModuleData({required this.code, required this.school, required this.title});
}
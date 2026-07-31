import 'package:flutter/material.dart';
import 'package:moodle/widgets/nav_drawer.dart';
import 'package:moodle/constants.dart';
import 'package:moodle/views/ds_course_view.dart';


class CoursesView extends StatelessWidget {
  const CoursesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final modules = [
      _ModuleData(
        code: "M234",
        school: "School of Computing",
        title: 'Database Systems',
        headerColor: moodlePurple,
        destinationBuilder: (context) => const DSCourseView(),

      ),
      const _ModuleData(
        code: "M235",
        school: "School of Computing",
        title: 'Algorithms and Structures',
        headerColor: moodlePurple,
        destinationBuilder: null,
      ),
      const _ModuleData(
        code: "M236",
        school: "School of Computing",
        title: 'Programming Fundamentals',
        headerColor: moodlePurple,
        destinationBuilder: null,
      ),
      const _ModuleData(
        code: "M237",
        school: "School of Computing",
        title: 'Software Engineering',
        headerColor: moodlePurple,
        destinationBuilder: null,
      ),
      const _ModuleData(
        code: "M238",
        school: "School of Computing",
        title: 'Operating Systems',
        headerColor: moodlePurple,
        destinationBuilder: null,
      )
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
                      'My Modules & Courses',
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
                          'My Modules & Courses',
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
                    _ProfileMenuButton(context: context),
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
                    _ProfileMenuButton(context: context),
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
                  'My Modules & Courses',
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
                LayoutBuilder(
                  builder: (context, gridConstraints) {
                    int columns;
                    if (gridConstraints.maxWidth < 480) {
                      columns = 1;
                    } else if (gridConstraints.maxWidth < 900) {
                      columns = 2;
                    } else {
                      columns = 3;
                    }

                    const spacing = 16.0;
                    final cardWidth =
                        (gridConstraints.maxWidth - spacing * (columns - 1)) /
                            columns;

                    return Wrap(
                      spacing: spacing,
                      runSpacing: spacing,
                      children: modules
                          .map(
                            (module) => SizedBox(
                              width: cardWidth,
                              child: _CourseCard(module: module),
                            ),
                          )
                          .toList(),
                    );
                  },
                ),
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
  final Color headerColor;
  final WidgetBuilder? destinationBuilder;

  const _ModuleData({
    required this.code,
    required this.school,
    required this.title,
    required this.headerColor,
    required this.destinationBuilder,
  });
}

class _CourseCard extends StatelessWidget {
  final _ModuleData module;
  const _CourseCard({Key? key, required this.module}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: moodleWhite,
      borderRadius: BorderRadius.circular(12),
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      child: InkWell(
        onTap: module.destinationBuilder != null
            ? () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: module.destinationBuilder!),
                )
            : null,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: moodleBorder),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  color: module.headerColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      module.code,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: moodleTextMuted,
                      ),
                    ),
                    Text(
                      module.school,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: moodleTextMuted,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      module.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: moodlePurple,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum _ProfileMenu { viewProfile, sign }

class _ProfileMenuButton extends StatelessWidget {
  final BuildContext context;
  const _ProfileMenuButton({required this.context});

  @override
  Widget build(BuildContext _) {
    return PopupMenuButton<_ProfileMenu>(
      offset: const Offset(0, 44),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: moodleBorder),
      ),
      onSelected: (action) {
        switch (action) {
          case _ProfileMenu.viewProfile:
            Navigator.pushNamed(context, '/profile');
            break;
          case _ProfileMenu.sign:
            Navigator.pushNamed(context, '/login');
            break;
        }
      },
      itemBuilder: (context) => const [
        PopupMenuItem(
          value: _ProfileMenu.viewProfile,
          child: Text('Profile'),
        ),
        PopupMenuDivider(),
        PopupMenuItem(
          value: _ProfileMenu.sign,
          child: Text('Sign out', style: TextStyle(color: Colors.red)),
        ),
      ],
      child: const CircleAvatar(
        radius: 18,
        backgroundColor: moodleGrayBg,
        foregroundColor: moodlePurple,
        child: Text(
          'KD',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
      ),
    );
  }
}
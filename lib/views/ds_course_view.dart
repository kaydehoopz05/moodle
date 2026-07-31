import 'package:flutter/material.dart';
import 'package:moodle/widgets/nav_drawer.dart';
import 'package:moodle/constants.dart';

class DSCourseView extends StatelessWidget {
  const DSCourseView({super.key});

  @override
  Widget build(BuildContext context) {
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
                      'Database Systems',
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
                        onTap: () {},
                        child: const Text(
                          'Database Systems',
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
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: isCompact ? 16.0 : 32.0,
                vertical: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/');
                        },
                        child: const Text(
                          'Dashboard',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: moodlePurple,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: Text(
                          '/',
                          style: TextStyle(fontSize: 14, color: moodleTextMuted),
                        ),
                      ),
                      const Text(
                        'M234-2025/26-DSALG',
                        style: TextStyle(fontSize: 14, color: moodleTextMuted),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Database Systems (DS) (2025/26)',
                    style: TextStyle(
                      fontSize: isCompact ? 22 : 30,
                      fontWeight: FontWeight.bold,
                      color: moodlePurple,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: moodleWhite,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: moodleBorder),
                    ),
                    child: DefaultTabController(
                      length: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TabBar(
                            isScrollable: true,
                            indicatorColor: moodlePurple,
                            labelColor: moodlePurple,
                            unselectedLabelColor: moodleTextMuted,
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            tabs: [
                              Tab(text: 'Course'),
                              Tab(text: 'Module Info'),
                              Tab(text: 'Assessment Information'),
                              Tab(text: 'Reading Lists'),
                              Tab(text: 'Grades'),
                              Tab(text: 'More'),
                            ],
                          ),
                          Container(height: 1, color: moodleBorder),
                          SizedBox(
                            height: isCompact ? 900 : 620,
                            child: TabBarView(
                              children: [
                                _CourseTab(isCompact: isCompact),
                                _ModuleInfoTab(isCompact: isCompact),
                                _AssessmentInfoTab(isCompact: isCompact),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _CourseTab extends StatefulWidget {
  final bool isCompact;
  const _CourseTab({required this.isCompact});

  @override
  State<_CourseTab> createState() => _CourseTabState();
}

class _CourseTabState extends State<_CourseTab> {
  bool _sectionExpanded = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () => setState(() => _sectionExpanded = !_sectionExpanded),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      AnimatedRotation(
                        turns: _sectionExpanded ? 0 : -0.25,
                        duration: const Duration(milliseconds: 150),
                        child: const Icon(Icons.expand_more, color: moodleTextDark),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Introduction to DSALG',
                        style: TextStyle(
                          fontSize: widget.isCompact ? 18 : 22,
                          fontWeight: FontWeight.bold,
                          color: moodleTextDark,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          if (_sectionExpanded) ...[
            const SizedBox(height: 16),
            const _InfoRow(
              label: 'Tutorials:',
              note: 'Note: Two one-hour tutorials per week\nare scheduled in your timetable.',
              slots:  ['Thu 12:00 - 13:00', 'Fri 13:00 - 14:00'],
              location: 'LT1 Richmond Building',
            ),
            const SizedBox(height: 1),
            const _InfoRow(
              label: 'Practical Sessions:',
              note: 'Note: A weekly two-hour practical\nsession is scheduled in your timetable.',
              slots: ['Mon 09:00 - 11:00', 'Tue 10:00 - 12:00'],
              location: 'Eldon Building, Lab 2.14',
            ),
          ],
        ],
      ),
    );
  }
}

class _ModuleInfoTab extends StatelessWidget {
  final bool isCompact;
  const _ModuleInfoTab({required this.isCompact});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Module Overview',
            style: TextStyle(
              fontSize: isCompact ? 20 : 24,
              fontWeight: FontWeight.bold,
              color: moodlePurple,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'We will refer to 3 keywords throughout this module:',
            style: TextStyle(fontSize: 14, color: moodleTextDark, height: 1.5),
          ),
          const SizedBox(height: 16),
          const _WordDefined(
            term: 'Efficiency',
            definition: 'Consider the consumption of time & space, with analysis before you code.',
          ),
          const SizedBox(height: 12),
          const _WordDefined(
            term: 'Trade-off/Cost',
            definition: 'Some structures and algorithms are better for your application at a cost.',
          ),
          const SizedBox(height: 12),
          const _WordDefined(
            term: 'Tools',
            definition: 'Avoid reinventing the wheels.',
          ),
          const SizedBox(height: 16),
          const Text(
            'This module is delivered in blended teaching this year, including lectures, tutorials and computer-based practical sessions.',
            style: TextStyle(fontSize: 14, color: moodleTextDark, height: 1.5),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Module Leader: ',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: moodleTextDark,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'Dr James Johnson',
                  style: TextStyle(
                    fontSize: 14,
                    color: moodlePurple,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _WordDefined extends StatelessWidget {
  final String term;
  final String definition;

  const _WordDefined({required this.term, required this.definition});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(fontSize: 14, color: moodleTextDark, height: 1.5),
        children: [
          TextSpan(
            text: '$term: ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(text: definition),
        ],
      ),
    );
  }
}

class _AssessmentInfoTab extends StatelessWidget {
  final bool isCompact;
  const _AssessmentInfoTab({required this.isCompact});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Assessment Information',
            style: TextStyle(
              fontSize: isCompact ? 18 : 24,
              fontWeight: FontWeight.bold,
              color: moodlePurple,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Your due dates, submission links, feedback dates and key guidance for this module '
            'are all in one place. Open any assessment below to see the details.',
            style: TextStyle(fontSize: 14, color: moodleTextDark, height: 1.5),
          ),
          const SizedBox(height: 8),
          RichText(
            text: const TextSpan(
              style: TextStyle(fontSize: 14, color: moodleTextDark, height: 1.5),
              children: [
                TextSpan(
                  text: 'Note: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'Only credit bearing assessments are shown on this page. You can see '
                      'all assessments on the My Assessments page linked at the top of Moodle '
                      'or in the module itself.',
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
            decoration: BoxDecoration(
              color: moodleGrayBg,
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Text(
              'Nothing to display',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: moodleTextDark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String note;
  final List<String> slots;
  final String location;

  const _InfoRow({
    required this.label,
    required this.note,
    required this.slots,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: moodleBorder)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: moodleTextDark,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    note,
                    style: const TextStyle(
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                      color: moodleTextMuted,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(width: 1, color: moodleBorder),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...slots.map(
                    (slot) => Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Row(
                        children: [
                          const Text('○ ', style: TextStyle(color: moodleTextDark)),
                          Text(
                            slot,
                            style: const TextStyle(fontSize: 14, color: moodleTextDark),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    location,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: moodleTextDark,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:moodle/constants.dart';
import 'package:moodle/widgets/nav_drawer.dart';

class AssessmentsView extends StatefulWidget {
  const AssessmentsView({Key? key}) : super(key: key);

  @override
  State<AssessmentsView> createState() => _AssessmentsViewState();
}

class _AssessmentsViewState extends State<AssessmentsView> {
  final Map<String, bool> _expandedMonths = {
    'July': true,
    'August': false,
    'September': false,
  };

  @override
  Widget build(BuildContext context) {
    final assessmentsByMonth = {
      'July 2026': [
        const _AssessmentData(
          title: 'Research Methods Draft',
          course: 'Research Methods',
          due: 'Due tomorrow • 23:59',
          type: 'Assignment',
        ),
        const _AssessmentData(
          title: 'Data Structures Quiz',
          course: 'Computer Science 101',
          due: 'Due in 3 days',
          type: 'Quiz',
        ),
      ],
      'August 2026': [
        const _AssessmentData(
          title: 'Statistics Lab Report',
          course: 'Mathematics for Computing',
          due: 'Due in 14 days',
          type: 'Lab report',
        ),
      ],
      'September 2026': [
        const _AssessmentData(
          title: 'Systems Design Presentation',
          course: 'Software Engineering',
          due: 'Due in 30 days',
          type: 'Presentation',
        ),
      ],
    };

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
              'My Assessments',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: moodlePurple,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Here are your upcoming assessments and deadlines.',
              style: TextStyle(fontSize: 15, color: moodleTextDark),
            ),
            const SizedBox(height: 24),
            ...assessmentsByMonth.entries.map((entry) {
              final month = entry.key;
              final items = entry.value;
              final isExpanded = _expandedMonths[month] ?? false;

              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: moodleWhite,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: moodleBorder),
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    initiallyExpanded: isExpanded,
                    onExpansionChanged: (expanded) {
                      setState(() {
                        _expandedMonths[month] = expanded;
                      });
                    },
                    title: Text(
                      month,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: moodlePurple,
                      ),
                    ),
                    trailing: const Icon(Icons.keyboard_arrow_down, color: moodlePurple),
                    children: [
                      ...items.map((assessment) => Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: moodleBg,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF2EFFF),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(
                                    Icons.assignment_outlined,
                                    color: moodlePurple,
                                    size: 18,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        assessment.title,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: moodleTextDark,
                                        ),
                                      ),
                                      const SizedBox(height: 3),
                                      Text(
                                        assessment.course,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: moodleTextMuted,
                                        ),
                                      ),
                                      const SizedBox(height: 3),
                                      Text(
                                        assessment.due,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: moodlePurple,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: moodleWhite,
                                    borderRadius: BorderRadius.circular(999),
                                    border: Border.all(color: moodleBorder),
                                  ),
                                  child: Text(
                                    assessment.type,
                                    style: const TextStyle(
                                      fontSize: 11,
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
            }),
          ],
        ),
      ),
    );
  }
}

class _AssessmentData {
  final String title;
  final String course;
  final String due;
  final String type;

  const _AssessmentData({
    required this.title,
    required this.course,
    required this.due,
    required this.type,
  });
}

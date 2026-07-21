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
                      const Text(
                        'Dashboard',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: moodlePurple,
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
              'Calendar',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: moodlePurple,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: moodleWhite,
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                border: Border.all(color: moodleBorder),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${_monthNames[DateTime.now().month - 1]} ${DateTime.now().year}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: moodleTextDark,
                    ),
                  ),
                  const SizedBox(height: 14),
                  _buildWeekDayLabels(),
                  const SizedBox(height: 12),
                  _buildDateGrid(DateTime.now()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }



  static const _monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  Widget _buildWeekDayLabels() {
    const weekDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return Row(
      children: weekDays
          .map(
            (label) => Expanded(
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: moodleTextMuted,
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildDateGrid(DateTime date) {
    final days = _monthDays(date);
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1,
      ),
      itemCount: days.length,
      itemBuilder: (context, index) {
        final day = days[index];
        final isToday = day != null && day == DateTime.now().day;
        return Container(
          decoration: BoxDecoration(
            color: day == null
                ? moodleBg
                : isToday
                    ? moodlePurple
                    : moodleWhite,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: moodleBorder),
          ),
          alignment: Alignment.center,
          child: Text(
            day == null ? '' : '$day',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: day == null
                  ? moodleTextMuted
                  : isToday
                      ? moodleWhite
                      : moodleTextDark,
            ),
          ),
        );
      },
    );
  }

  List<int?> _monthDays(DateTime date) {
    final firstDay = DateTime(date.year, date.month, 1);
    final firstWeekday = (firstDay.weekday + 6) % 7;
    final totalDays = DateTime(date.year, date.month + 1, 0).day;

    final days = <int?>[];
    for (var i = 0; i < firstWeekday; i++) {
      days.add(null);
    }
    for (var day = 1; day <= totalDays; day++) {
      days.add(day);
    }
    while (days.length % 7 != 0) {
      days.add(null);
    }
    return days;
  }
}

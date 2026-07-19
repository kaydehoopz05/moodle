import 'package:flutter/material.dart';
import 'package:moodle/constants.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name ?? '/';
    final bool isDashboard = currentRoute == '/';
    final bool isCourses = currentRoute == '/courses';

    return Drawer(
      backgroundColor: moodleWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
              decoration: const BoxDecoration(
                color: moodlePurple,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: moodleWhite,
                    child:  Icon(Icons.person, size: 30, color: moodlePurple),
                  ),
                   SizedBox(height: 12),
                   Text(
                    'Yourname Here',
                    style: TextStyle(
                      color: moodleWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                   SizedBox(height: 4),
                   Text(
                    'up1234567@myport.ac.uk',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            _DrawerItem(
              icon: Icons.dashboard_outlined,
              label: 'Dashboard',
              selected: isDashboard,
              onTap: () {
                Navigator.pop(context);
                if (!isDashboard) {
                  Navigator.pushReplacementNamed(context, '/');
                }
              },
            ),
            _DrawerItem(
              icon: Icons.school_outlined,
              label: 'My courses',
              selected: isCourses,
              onTap: () {
                Navigator.pop(context);
                if (!isCourses) {
                  Navigator.pushReplacementNamed(context, '/courses');
                }
              },
            ),
            _DrawerItem(
              icon: Icons.calendar_month_outlined,
              label: 'Calendar',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            _DrawerItem(
              icon: Icons.grade_outlined,
              label: 'Grades',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            _DrawerItem(
              icon: Icons.mail_outline,
              label: 'Messages',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _DrawerItem({
    required this.icon,
    required this.label,
    this.selected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: selected ? moodlePurple : moodleTextDark,
      ),
      title: Text(
        label,
        style: TextStyle(
          color: selected ? moodlePurple : moodleTextDark,
          fontWeight: selected ? FontWeight.bold : FontWeight.w500,
        ),
      ),
      selected: selected,
      selectedTileColor: const Color(0xFFF2EFFF),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      onTap: onTap,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:moodle/widgets/nav_drawer.dart';
import 'package:moodle/constants.dart';

class ProfilePageView extends StatelessWidget {
  const ProfilePageView({Key? key}) : super(key: key);

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
                const SizedBox(width: 10),
                if (isCompact)
                  const Expanded(
                    child: Text(
                      'Profile',
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
                    __ProfileMenuButton(context: context),
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
                  Row(
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
                            'Profile',
                            style: TextStyle(fontSize: 14, color: moodleTextMuted),
                          ),
                        ],
                      ),
                      const Spacer(),
                      if (!isCompact)
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            backgroundColor: moodlePurple,
                            foregroundColor: moodleWhite,
                            side: const BorderSide(color: moodlePurple),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 14,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: const Text(
                            'Reset page to default',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ),
                    ],
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

enum _ProfileMenu { viewProfile, sign }

class __ProfileMenuButton extends StatelessWidget {
  final BuildContext context;
  const __ProfileMenuButton({required this.context});

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
          child: Text('View profile'),
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
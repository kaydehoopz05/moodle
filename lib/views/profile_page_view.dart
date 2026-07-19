import 'package:flutter/material.dart';
import 'package:moodle/widgets/nav_drawer.dart';
import 'package:moodle/constants.dart';

class ProfilePageView extends StatelessWidget {
  const ProfilePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: moodleWhite,
        foregroundColor: moodleTextDark,
        elevation: 1,
        titleSpacing: 0,
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                width: 32,
                height: 32,
                child: Image.asset(
                  'images/moodle_logo.png',
                  fit: BoxFit.contain,
                ),
              ),
              const Text(
                'Profile',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
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
          const CircleAvatar(
            radius: 18,
            backgroundColor: moodleGrayBg,
            foregroundColor: moodlePurple,
            child: Text(
              'YH',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      drawerEdgeDragWidth:
          MediaQuery.of(context).size.width * 0.2,
      drawerEnableOpenDragGesture:
          true,
      drawer:
          const NavDrawer(),
      body: const Center(
        child: Text('Profile Page Content'),
      ),
    );
  }
}
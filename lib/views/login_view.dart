// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:moodle/widgets/nav_drawer.dart';
import 'package:moodle/constants.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 68,
            height: 68,
            decoration: BoxDecoration(
              color: moodleGrayBg,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset(
              'images/moodle_logo.png',
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}

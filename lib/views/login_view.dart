// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:moodle/widgets/nav_drawer.dart';
import 'package:moodle/constants.dart';
import 'package:moodle/views/dashboard_view.dart';

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
          const SizedBox(height: 40),
        const Text('Log in to access your moodle',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        )),
        const SizedBox(height: 8),
        const TextField(
          decoration: InputDecoration(
            labelText: 'University Email',
            border: OutlineInputBorder(),
          )),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            width: 160,
            height: 45,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Login',
              style: TextStyle(
                color: moodleDarkPurple
              )),
            ),
          )
        ],
      ),
    );
  }
}

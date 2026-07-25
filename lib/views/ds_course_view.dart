// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:moodle/widgets/nav_drawer.dart';
import 'package:moodle/constants.dart';
import 'package:moodle/views/courses_view.dart';

class DSCourseView extends StatelessWidget {
  const DSCourseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('M234 - School of Computing - Data Science Course'),
      ),
      drawer: const NavDrawer(),
      body: const Center(
        child: Text('Welcome to the Data Science Course!'),
      ),
    );
  }
}
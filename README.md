# Moodle — Flutter Coursework

> **A recreation of Portsmouth's moodle website, built as university coursework.**

## Table of Contents

- [Overview](#overview)
- [Run the Application](#run-the-application)
- [Project Structure](#project-structure)
  
---
## Overview
Functional side navigation drawer

---

## Run the Application

```bash
flutter pub get
flutter run -d chrome
```

## Project Structure

moodle/
├── lib/
│   ├── main.dart                  # Application entry point, route table, and themes
│   ├── constants.dart              # Colors and style constants
│   ├── widgets/
│   │   └── nav_drawer.dart         # Side navigation drawer
│   └── views/
│       ├── dashboard_view.dart     # Home dashboard
│       ├── courses_view.dart       # Enrolled modules
│       ├── ds_course_view.dart     # Course detail page
│       ├── calendar_view.dart      # Calendar view
│       ├── assessments_view.dart   # Assessments overview
│       ├── notification_view.dart  # Notifications page
│       ├── profile_page_view.dart  # User profile
│       └── login_view.dart         # Login screen for site
├── test/
│   └── widget_test.dart
├── web/                            
├── images/                         
└── pubspec.yaml
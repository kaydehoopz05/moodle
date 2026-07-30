# Moodle — Flutter Coursework

> **A recreation of Portsmouth's moodle website, built as university coursework.**

## Table of Contents

- [Overview](#overview)
- [features](#features)
- [Project Structure](#project-structure)
  
---
## Overview
This project is based on the core screens of moodle (dashboard, course info, assessments,
calendar, profile, and notifications pages), built as a Flutter app. The layout is adaptable
between a mobile view and a wider view by using LayoutBuilder, allowing the code to work 
regardless of screen size.

---
## Features
**Dashboard** - Contains a search bar, upcoming assignments, and filters
**Courses** - Has a list of modules the user is enrolled in, displayed as cards
**Responsive Pages** - Each page can switch between a compact layout and a wider one, which can contain a full navigation bar
**Course detail page** - Page with course info, location, and the times of timetabled sessions
**Calendar** - A calendar with the ability to show month by month, highlighting the current day 
**Assessments** - Page dedicated to tracking the deadlines of assessments
**Log In Page** - A basic log in page with basic authentication
**Side navigation drawer** - Drawer navigation which works on all screens, in compact and wider
layouts

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
# Moodle — Flutter Coursework

> **A recreation of Portsmouth's moodle website, built as university coursework.**

## Table of Contents

- [Overview](#overview)
- [features](#features)
- [Getting Started](#getting-started)
- [Project Structure](#project-structure)
- [Routes](#routes)
  
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
## Getting Started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (Dart SDK `>=2.17.0 <4.0.0`, as set in `pubspec.yaml`)
- A configured target: Chrome (web), an emulator, or a physical device

---
### Installation
 
```bash
git clone https://github.com/kaydehoopz05/moodle.git
cd moodle
flutter pub get
```
 
### Run
 
```bash
flutter run -d chrome
```

## Project Structure

```
moodle/
├── lib/
│   ├── main.dart                  # App entry point, theming, and route table
│   ├── constants.dart              # Shared colors and style constants
│   ├── widgets/
│   │   └── nav_drawer.dart         # Shared side navigation drawer
│   └── views/
│       ├── dashboard_view.dart     # Home dashboard
│       ├── courses_view.dart       # Enrolled modules list
│       ├── ds_course_view.dart     # Individual course detail page
│       ├── calendar_view.dart      # Calendar view
│       ├── assessments_view.dart   # Assessments overview
│       ├── notification_view.dart  # Notifications
│       ├── profile_page_view.dart  # User profile
│       └── login_view.dart         # Login screen
├── test/
│   └── widget_test.dart
├── web/                            # Web build assets (icons, manifest, index.html)
├── images/                         # App assets (logo, setup screenshots)
└── pubspec.yaml
```
---

## Routes
 
Defined in `main.dart`:

| Route              | Screen               |
|--------------------|----------------------|
| `/`                | `DashboardView`      |
| `/calendar`        | `CalendarView`       |
| `/courses`         | `CoursesView`        |
| `/assessments`     | `AssessmentsView`    |
| `/profile`         | `ProfilePageView`    |
| `/notifications`   | `NotificationView`   |
| `/login`           | `LoginView`          |
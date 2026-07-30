# Moodle — Flutter Coursework

> **A rendition of Portsmouth's moodle website.**

## Table of Contents

- [Highlights](#highlights)
- [Run the Application](#run-the-application)
- [Project Structure](#project-structure)
  
---
## Highlights
Functional side navigation drawer

---

## Run the Application

```bash
flutter pub get
flutter run -d chrome
```

## Project Structure

moodle/
|-- lib/
    |-- main.dart
    |constants.dart
    |
    |-- widgets/
        |-- nav_drawer.dart
    |-- views/
        |-- assessments_view.dart
        |-- calendar_view.dart 
        |-- courses_view.dart
        |-- dashboard_view.dart
        |-- ds_course_view.dart
        |-- login_view.dart
        |-- notification_view.dart
        |-- profile_page_view.dart
    |-- test/
        |-- widget_test.dart
|-- README.md
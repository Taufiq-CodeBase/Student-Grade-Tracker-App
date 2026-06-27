# Student Grade Tracker App

A simple Flutter app for tracking subjects, marks, and grade summaries.

## Features

- Add subjects with validation for subject name and marks from 0 to 100.
- View all saved subjects in a list with grade information.
- Swipe to delete subjects from the list.
- See a live summary with total subjects, average mark, and overall grade.
- Toggle between light and dark themes using custom theme data.

## Architecture

The app uses a simple clean architecture with a feature-based structure:

- core/constants for shared constants
- core/theme for custom theme definitions
- features/subjects for the subject model, provider state, and screens

## Run locally

1. Install Flutter.
2. Run `flutter pub get`.
3. Start the app with `flutter run`.

## Testing

Run:

- `flutter test`
- `flutter analyze`

## Snapshots

App screenshots of the three main screens below:

<div align="center">
  <img src="assets/add_subject.png" alt="Add Subject Screen" width="250" style="margin: 0 24px 24px 0;" />
  <img src="assets/sub_list_&_delete.png" alt="Subject List Screen" width="250" style="margin: 0 24px 24px 0;" />
  <img src="assets/summary.png" alt="Summary Screen" width="250" style="margin: 0 0 24px 0;" />
</div>

## Dark mode

<div align="center">
  <img src="assets/dark_add_subject.png" alt="Add Subject Screen" width="250" style="margin: 0 24px 24px 0;" />
  <img src="assets/dark_sub_list_&_delete.png" alt="Subject List Screen" width="250" style="margin: 0 24px 24px 0;" />
  <img src="assets/dark_summary.png" alt="Summary Screen" width="250" style="margin: 0 0 24px 0;" />
</div>

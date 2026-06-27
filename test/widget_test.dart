// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:student_grade_tracker_app/features/subjects/presentation/providers/subject_provider.dart';
import 'package:student_grade_tracker_app/main.dart';

void main() {
  testWidgets('app builds and shows the add subject screen', (tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => SubjectProvider(),
        child: const StudentGradeTrackerApp(),
      ),
    );

    expect(find.text('Add Subject'), findsWidgets);
    expect(find.text('Add a new subject'), findsOneWidget);
  });
}

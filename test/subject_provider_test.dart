import 'package:flutter_test/flutter_test.dart';
import 'package:student_grade_tracker_app/features/subjects/data/models/subject.dart';
import 'package:student_grade_tracker_app/features/subjects/presentation/providers/subject_provider.dart';

void main() {
  group('Subject', () {
    test('returns the correct grade thresholds', () {
      final aGrade = Subject(name: 'Math', mark: 85);
      final bGrade = Subject(name: 'Science', mark: 70);
      final cGrade = Subject(name: 'History', mark: 55);
      final fGrade = Subject(name: 'Art', mark: 40);

      expect(aGrade.grade, 'A');
      expect(bGrade.grade, 'B');
      expect(cGrade.grade, 'C');
      expect(fGrade.grade, 'F');
    });
  });

  group('SubjectProvider', () {
    test('adds, removes, and computes summary values correctly', () {
      final provider = SubjectProvider();

      provider.addSubject('Math', 85);
      provider.addSubject('Science', 70);

      expect(provider.subjects.length, 2);
      expect(provider.averageMark, 77.5);
      expect(provider.passingSubjects.length, 2);
      expect(provider.summaryGrade, 'B');

      provider.removeSubject(0);

      expect(provider.subjects.length, 1);
      expect(provider.averageMark, 70.0);
      expect(provider.summaryGrade, 'B');
    });
  });
}

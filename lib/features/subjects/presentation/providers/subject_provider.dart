import 'package:flutter/material.dart';
import '../../data/models/subject.dart';

class SubjectProvider extends ChangeNotifier {
  final List<Subject> _subjects = [];
  int _currentIndex = 0;
  bool _isDarkMode = false;

  List<Subject> get subjects => List.unmodifiable(_subjects);

  List<Subject> get passingSubjects =>
      _subjects.where((subject) => subject.mark >= 50).toList();

  int get totalSubjects => _subjects.length;

  int get currentIndex => _currentIndex;

  bool get isDarkMode => _isDarkMode;

  double get averageMark {
    if (_subjects.isEmpty) {
      return 0;
    }
    final total = _subjects.fold<int>(0, (sum, subject) => sum + subject.mark);
    return total / _subjects.length;
  }

  String get summaryGrade {
    if (_subjects.isEmpty) {
      return 'F';
    }

    final average = averageMark;
    if (average >= 80) {
      return 'A';
    }
    if (average >= 65) {
      return 'B';
    }
    if (average >= 50) {
      return 'C';
    }
    return 'F';
  }

  void addSubject(String name, int mark) {
    _subjects.add(Subject(name: name, mark: mark));
    notifyListeners();
  }

  void removeSubject(int index) {
    if (index >= 0 && index < _subjects.length) {
      _subjects.removeAt(index);
      notifyListeners();
    }
  }

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

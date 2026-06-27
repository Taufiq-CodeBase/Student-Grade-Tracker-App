import 'package:flutter/material.dart';
import '../../data/models/subject.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard({super.key, required this.subject});

  final Subject subject;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final gradeColor = _gradeColor(subject.grade, colorScheme);

    return Card(
      color: colorScheme.surfaceContainerHighest.withValues(alpha: 0.55),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subject.name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text('Mark: ${subject.mark}'),
                  Text('Grade: ${subject.grade}'),
                ],
              ),
            ),
            Container(
              width: 54,
              height: 54,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color: gradeColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.shadow.withValues(alpha: 0.12),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Text(
                subject.grade,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: colorScheme.onPrimaryContainer,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Color _gradeColor(String grade, ColorScheme colorScheme) {
  switch (grade) {
    case 'A':
      return colorScheme.primaryContainer;
    case 'B':
      return colorScheme.secondaryContainer;
    case 'C':
      return colorScheme.tertiaryContainer;
    default:
      return colorScheme.errorContainer;
  }
}

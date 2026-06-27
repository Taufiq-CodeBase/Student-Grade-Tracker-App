import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/subject_provider.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SubjectProvider>(
      builder: (context, provider, child) {
        final colorScheme = Theme.of(context).colorScheme;
        final overallGradeColor = _gradeColor(
          provider.summaryGrade,
          colorScheme,
        );

        return LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth > 640;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Performance summary',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Your overview updates instantly as subjects change.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 24),
                    if (isWide)
                      Row(
                        children: [
                          Expanded(
                            child: _SummaryTile(
                              title: 'Total Subjects',
                              value: provider.totalSubjects.toString(),
                              accent: colorScheme.primary,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _SummaryTile(
                              title: 'Average Mark',
                              value: provider.averageMark.toStringAsFixed(1),
                              accent: colorScheme.secondary,
                            ),
                          ),
                        ],
                      )
                    else
                      Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: _SummaryTile(
                              title: 'Total Subjects',
                              value: provider.totalSubjects.toString(),
                              accent: colorScheme.primary,
                            ),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            child: _SummaryTile(
                              title: 'Average Mark',
                              value: provider.averageMark.toStringAsFixed(1),
                              accent: colorScheme.secondary,
                            ),
                          ),
                        ],
                      ),
                    const SizedBox(height: 12),
                    _SummaryTile(
                      title: 'Overall Grade',
                      value: provider.summaryGrade,
                      accent: overallGradeColor,
                      wide: true,
                    ),
                    const SizedBox(height: 20),
                    Card(
                      color: colorScheme.surfaceContainerHighest.withValues(
                        alpha: 0.6,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Passing subjects',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              provider.passingSubjects
                                  .map((subject) => subject.name)
                                  .join(', '),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
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

class _SummaryTile extends StatelessWidget {
  const _SummaryTile({
    required this.title,
    required this.value,
    required this.accent,
    this.wide = false,
  });

  final String title;
  final String value;
  final Color accent;
  final bool wide;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: wide ? double.infinity : null,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: accent.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: accent.withValues(alpha: 0.28)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}

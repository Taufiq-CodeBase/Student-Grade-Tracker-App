import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/constants/app_constants.dart';
import 'core/theme/app_theme.dart';
import 'features/subjects/presentation/providers/subject_provider.dart';
import 'features/subjects/presentation/screens/add_subject_screen.dart';
import 'features/subjects/presentation/screens/subject_list_screen.dart';
import 'features/subjects/presentation/screens/summary_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => SubjectProvider(),
      child: const StudentGradeTrackerApp(),
    ),
  );
}

class StudentGradeTrackerApp extends StatelessWidget {
  const StudentGradeTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SubjectProvider>(
      builder: (context, provider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppConstants.appTitle,
          theme: AppTheme.lightTheme(),
          darkTheme: AppTheme.darkTheme(),
          themeMode: provider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          home: const HomeScreen(),
        );
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screens = <Widget>[
      const AddSubjectScreen(),
      const SubjectListScreen(),
      const SummaryScreen(),
    ];

    return Consumer<SubjectProvider>(
      builder: (context, provider, child) {
        final titles = <String>[
          AppConstants.appTitle,
          AppConstants.subjectsLabel,
          AppConstants.summaryLabel,
        ];

        return Scaffold(
          appBar: AppBar(
            title: Text(titles[provider.currentIndex]),
            actions: [
              IconButton(
                onPressed: provider.toggleTheme,
                icon: Icon(
                  provider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                ),
                tooltip: 'Toggle theme',
              ),
            ],
          ),
          body: IndexedStack(index: provider.currentIndex, children: screens),
          bottomNavigationBar: NavigationBar(
            selectedIndex: provider.currentIndex,
            onDestinationSelected: provider.setCurrentIndex,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.add_circle_outline),
                label: 'Add',
              ),
              NavigationDestination(icon: Icon(Icons.list_alt), label: 'List'),
              NavigationDestination(
                icon: Icon(Icons.bar_chart),
                label: 'Summary',
              ),
            ],
          ),
        );
      },
    );
  }
}

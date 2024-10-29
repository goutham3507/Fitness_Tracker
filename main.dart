import 'package:flutter/material.dart';
import 'constants.dart';
import 'screens/home_screen.dart';
import 'screens/workout_log_screen.dart';
import 'screens/meal_planning_screen.dart';
import 'screens/progress_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/main_navigation_screen.dart';

void main() {
  runApp(FitnessTrackerApp());
}

class FitnessTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness Tracker',
      theme: appTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => MainNavigationScreen(),
        '/workout': (context) => WorkoutLogScreen(),
        '/meal': (context) => MealPlanningScreen(),
        '/progress': (context) => ProgressScreen(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}

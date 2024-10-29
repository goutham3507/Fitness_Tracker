import 'package:flutter/material.dart';
import '../constants.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;  // Define onTap here

  CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,  // Use onTap here
      selectedItemColor: ColorConstants.accentColor,
      unselectedItemColor: ColorConstants.grey,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: 'Workout'),
        BottomNavigationBarItem(icon: Icon(Icons.restaurant), label: 'Meals'),
        BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: 'Progress'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}

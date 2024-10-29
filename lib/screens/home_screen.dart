import 'package:flutter/material.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_card.dart';
import '../../widgets/custom_bottom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fitness Tracker',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          CustomCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back!',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(height: 8),
                Text(
                  'Let’s get moving today.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          CustomCard(
            child: Column(
              children: [
                CustomButton(
                  label: 'Log Workout',
                  onPressed: () {
                    Navigator.pushNamed(context, '/workout');
                  },
                ),
                SizedBox(height: 16),
                CustomButton(
                  label: 'Meal Planning',
                  onPressed: () {
                    Navigator.pushNamed(context, '/meal');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
     
    );
  }
}

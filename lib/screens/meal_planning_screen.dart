import 'package:flutter/material.dart';

class MealPlanningScreen extends StatefulWidget {
  @override
  _MealPlanningScreenState createState() => _MealPlanningScreenState();
}

class _MealPlanningScreenState extends State<MealPlanningScreen> {
  // List to store meal data
  List<Map<String, dynamic>> meals = [];
  int totalCalories = 0;

  // Function to show dialog to add a meal
  void _addMeal() {
    String mealName = '';
    String description = '';
    String calories = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add Meal"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: "Meal Name"),
                onChanged: (value) {
                  mealName = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: "Description"),
                onChanged: (value) {
                  description = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: "Calories"),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  calories = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                if (mealName.isNotEmpty && calories.isNotEmpty) {
                  setState(() {
                    int calorieValue = int.tryParse(calories) ?? 0;
                    meals.add({
                      'name': mealName,
                      'description': description,
                      'calories': calorieValue,
                    });
                    totalCalories += calorieValue;
                  });
                }
                Navigator.of(context).pop();
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }

  // Function to delete a meal and update calories
  void _deleteMeal(int index) {
    setState(() {
      totalCalories -= (meals[index]['calories'] as int);
      meals.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meal Planning',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total Calories: $totalCalories',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          Expanded(
            child: meals.isEmpty
                ? Center(
                    child: Text("No meals added yet."),
                  )
                : ListView.builder(
                    itemCount: meals.length,
                    itemBuilder: (context, index) {
                      final meal = meals[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: ListTile(
                          title: Text(
                            meal['name'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(meal['description']),
                              SizedBox(height: 4),
                              Text("Calories: ${meal['calories']} kcal"),
                            ],
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _deleteMeal(index),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addMeal,
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
      ),
    );
  }
}

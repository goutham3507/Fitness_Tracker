import 'package:flutter/material.dart';

class WorkoutLogScreen extends StatefulWidget {
  @override
  _WorkoutLogScreenState createState() => _WorkoutLogScreenState();
}

class _WorkoutLogScreenState extends State<WorkoutLogScreen> {
  // List to store workout logs
  List<Map<String, String>> workoutLogs = [];

  // Function to show dialog to add a workout
  void _addWorkout() {
    String workoutName = '';
    String duration = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Log Workout"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: "Workout Name"),
                onChanged: (value) {
                  workoutName = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: "Duration (in minutes)"),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  duration = value;
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
                if (workoutName.isNotEmpty && duration.isNotEmpty) {
                  setState(() {
                    workoutLogs.add({
                      'name': workoutName,
                      'duration': duration,
                    });
                  });
                }
                Navigator.of(context).pop();
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Workout Log"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: workoutLogs.isEmpty
          ? Center(
              child: Text("No workouts logged yet."),
            )
          : ListView.builder(
              itemCount: workoutLogs.length,
              itemBuilder: (context, index) {
                final workout = workoutLogs[index];
                return ListTile(
                  title: Text(workout['name']!),
                  subtitle: Text("${workout['duration']} mins"),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addWorkout,
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add),
      ),
    );
  }
}

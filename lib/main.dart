import 'package:flutter/material.dart';
import 'package:habit_tracking/models/habit.dart';
import 'package:habit_tracking/widgets/habit_list.dart';
import 'package:habit_tracking/widgets/new_habit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Suivi d’Habitudes',
      theme: ThemeData(
        primarySwatch: Colors.blue, // Utilisation de Colors.blue pour primarySwatch
      ),
      home: HabitTracker(),
    );
  }
}

class HabitTracker extends StatefulWidget {
  @override
  _HabitTrackerState createState() => _HabitTrackerState();
}

class _HabitTrackerState extends State<HabitTracker> {
  final List<Habit> _habits = [];

  void _addHabit(String name) {
    final newHabit = Habit(name: name);
    setState(() {
      _habits.add(newHabit);
    });
  }

  void _toggleCompletion(int index) {
    setState(() {
      _habits[index].toggleComplete();
    });
  }

  void _deleteHabit(int index) {
    setState(() {
      _habits.removeAt(index);
    });
  }

  void _startAddNewHabit(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewHabit(_addHabit),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [
              Colors.green.shade400,
              Color.fromARGB(255, 44, 126, 48), // Deuxième couleur pour le dégradé
            ],
          ).createShader(Rect.fromLTWH(0.0, 0.0, bounds.width, bounds.height)),
          child: Center(
            child: Text(
              'Suivi d’Habitudes',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 247, 248, 248), // Couleur pour le texte masqué
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: HabitList(_habits, _toggleCompletion, _deleteHabit), // Ajout de la fonction deleteHabit
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewHabit(context),
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Color.fromARGB(255, 240, 248, 248),
    );
  }
}

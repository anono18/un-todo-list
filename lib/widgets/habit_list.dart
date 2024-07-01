import 'package:flutter/material.dart';
import 'package:habit_tracking/models/habit.dart';

class HabitList extends StatelessWidget {
  final List<Habit> habits;
  final Function toggleCompletion;
  final Function deleteHabit; // Fonction pour supprimer une habitude

  HabitList(this.habits, this.toggleCompletion, this.deleteHabit);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: habits.length,
      itemBuilder: (ctx, index) {
        return Card(
          child: ListTile(
            title: Row(
              children: [
                Expanded(
                  child: Text(habits[index].name),
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => deleteHabit(index), // Appeler la fonction pour supprimer l'habitude
                ),
              ],
            ),
            trailing: Checkbox(
              value: habits[index].isComplete,
              onChanged: (_) => toggleCompletion(index),
              activeColor: Colors.green,
            ),
          ),
        );
      },
    );
  }
}

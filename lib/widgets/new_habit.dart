import 'package:flutter/material.dart';

class NewHabit extends StatefulWidget {
  final Function addHabit;

  NewHabit(this.addHabit);

  @override
  _NewHabitState createState() => _NewHabitState();
}

class _NewHabitState extends State<NewHabit> {
  final _nameController = TextEditingController();

  void _submitData() {
    final enteredName = _nameController.text;

    if (enteredName.isEmpty) {
      return;
    }

    widget.addHabit(enteredName);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nom de l’habitude'),
              onSubmitted: (_) => _submitData(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Annuler', style: TextStyle(color: Colors.red)),
                ),
                ElevatedButton(
                  onPressed: _submitData,
                  child: Text('Ajouter',style: TextStyle(color: Colors.green),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

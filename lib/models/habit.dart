class Habit {
  final String name;
  bool isComplete;

  Habit({required this.name, this.isComplete = false});

  void toggleComplete() {
    isComplete = !isComplete;
  }
}

class Task {
  final String? name;
  bool isComplete;

  Task({this.name, this.isComplete = false});

  void toggleComplete() => isComplete = !isComplete;
}

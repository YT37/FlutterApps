import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todoey/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [];

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);
  int get taskLen => _tasks.length;

  void addTask(String title) {
    _tasks.add(Task(name: title));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleComplete();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }
}

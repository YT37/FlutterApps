import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './task_tile.dart';
import '../models/task_data.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, tasks, child) {
        return ListView.builder(
          itemCount: tasks.taskLen,
          itemBuilder: (context, index) {
            final task = tasks.tasks[index];

            return TaskTile(
              title: task.name!,
              isChecked: task.isComplete,
              checkboxCallback: (bool? checkboxState) => tasks.updateTask(task),
              longPressCallback: () => tasks.deleteTask(task),
            );
          },
        );
      },
    );
  }
}

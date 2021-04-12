import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String title;

    return SafeArea(
      child: Container(
          color: Color(0xff757575),
          child: Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Add Task",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, color: Colors.lightBlueAccent),
                ),
                TextField(
                  autofocus: true,
                  textAlign: TextAlign.center,
                  onChanged: (newTitle) {
                    title = newTitle;
                  },
                ),
                SizedBox(height: 10),
                MaterialButton(
                  onPressed: () {
                    if (title != null) {
                      Provider.of<TaskData>(context, listen: false)
                          .addTask(title);
                      Navigator.pop(context);
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  color: Colors.lightBlueAccent,
                  child: Text(
                    "Add",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

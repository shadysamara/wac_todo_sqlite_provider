import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wac_todo_db/models/task_model.dart';
import 'package:wac_todo_db/repositories/db_provider.dart';

class TaskItem extends StatelessWidget {
  TaskModel taskModel;
  TaskItem(this.taskModel);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
        child: ListTile(
      title: Text(taskModel.taskTitle),
      trailing: Checkbox(
        value: taskModel.isComplete,
        onChanged: (value) {
          Provider.of<DBProvider>(context, listen: false).updateTask(taskModel);
        },
      ),
    ));
  }
}

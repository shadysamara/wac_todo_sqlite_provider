import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wac_todo_db/models/task_model.dart';
import 'package:wac_todo_db/repositories/db_provider.dart';
import 'package:wac_todo_db/ui/widgets/taskItem.dart';

class InCompleteTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // DBProvider dbProvider = Provider.of<DBProvider>(context);
    // TODO: implement build
    return Consumer<DBProvider>(
      builder: (context, DBProvider value, child) {
        return FutureBuilder<List<TaskModel>>(
          future: value.getInCompleteTasks(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                List<TaskModel> tasks = snapshot.data;
                return ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return TaskItem(tasks[index]);
                  },
                );
              } else {
                return Center(
                  child: Text('No Tasks Found'),
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        );
      },
    );
  }
}

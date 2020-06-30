import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wac_todo_db/models/task_model.dart';
import 'package:wac_todo_db/repositories/db_provider.dart';
import 'package:wac_todo_db/ui/screens/tasks_tabs/all_tasks.dart';
import 'package:wac_todo_db/ui/screens/tasks_tabs/complete_tasks.dart';
import 'package:wac_todo_db/ui/screens/tasks_tabs/unComplete_tasks.dart';

class TaskHome extends StatelessWidget {
  String newTaskTile;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('TODO'),
          bottom: TabBar(tabs: [
            Tab(
              text: 'All Tasks',
            ),
            Tab(
              text: 'Complete Tasks',
            ),
            Tab(
              text: 'InComplete Tasks',
            )
          ]),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: TabBarView(children: [
              AllTasks(),
              CompleteTasks(),
              InCompleteTasks()
            ])),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    TaskModel taskModel = TaskModel(controller.text, false);
                    Provider.of<DBProvider>(context, listen: false)
                        .insertNewData(taskModel);
                    controller.clear();
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

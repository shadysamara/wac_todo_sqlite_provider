import 'package:flutter/material.dart';
import 'package:wac_todo_db/models/task_model.dart';
import 'package:wac_todo_db/repositories/db_helper.dart';

class DBProvider extends ChangeNotifier {
  Future<List<TaskModel>> getAllTasks() async {
    List<Map<String, dynamic>> allTasks =
        await DBHelper.dbinstance.getAllTasks();
    List<TaskModel> tasks = allTasks.map((e) => TaskModel.frmJson(e)).toList();
    return tasks;
  }

  Future<List<TaskModel>> getCompleteTasks() async {
    List<Map<String, dynamic>> allTasks =
        await DBHelper.dbinstance.getCompletedData();
    List<TaskModel> tasks = allTasks.map((e) => TaskModel.frmJson(e)).toList();
    return tasks;
  }

  Future<List<TaskModel>> getInCompleteTasks() async {
    List<Map<String, dynamic>> allTasks =
        await DBHelper.dbinstance.getInCompletedData();
    List<TaskModel> tasks = allTasks.map((e) => TaskModel.frmJson(e)).toList();
    return tasks;
  }

  excuteAllMethods() {
    getAllTasks();
    getCompleteTasks();
    getInCompleteTasks();
    notifyListeners();
  }

  insertNewData(TaskModel taskModel) async {
    await DBHelper.dbinstance.insertNewTask(taskModel);
    excuteAllMethods();
  }

  updateTask(TaskModel taskModel) async {
    taskModel.toggleComplete();
    await DBHelper.dbinstance.updateTask(taskModel);
    excuteAllMethods();
  }

  deleteTask(TaskModel taskModel) async {
    await DBHelper.dbinstance.deleteTask(taskModel);
    excuteAllMethods();
  }
}

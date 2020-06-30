import 'package:wac_todo_db/constants.dart';

class TaskModel {
  int taskId;
  String taskTitle;
  bool isComplete;
  TaskModel(this.taskTitle, this.isComplete);

  TaskModel.frmJson(Map<String, dynamic> map) {
    this.taskId = map[columId];
    this.taskTitle = map[columTaskTitle];
    this.isComplete = map[columTaskComplete] == 1 ? true : false;
  }

  toJson() {
    return {
      columTaskTitle: this.taskTitle,
      columTaskComplete: this.isComplete ? 1 : 0
    };
  }

  toggleComplete() {
    isComplete = !isComplete;
  }
}

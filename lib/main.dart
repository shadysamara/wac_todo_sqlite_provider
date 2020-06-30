import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wac_todo_db/repositories/db_provider.dart';
import 'package:wac_todo_db/ui/screens/task_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DBProvider>(
      create: (context) => DBProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        home: TaskHome(),
      ),
    );
  }
}

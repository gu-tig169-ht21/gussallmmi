import 'package:flutter/material.dart';
import './ToDoListView.dart';
import 'model.dart';
import 'package:provider/provider.dart';

void main() {
  var state = MyState();
  state.getList();
  runApp(ChangeNotifierProvider(create: (context) => state, child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ToDo App",
      home: TodoListView(),
    );
  }
}

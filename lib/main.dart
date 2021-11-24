//import 'dart:html';

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import './ToDoListView.dart';
import 'model.dart';
import 'package:provider/provider.dart';

List<TodoListItem> todolist = [];

void main() {
  var state = MyState();
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

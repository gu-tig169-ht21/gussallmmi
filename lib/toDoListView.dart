// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model.dart';
import './main.dart';
import 'TodoListView.dart';

class TodoList extends StatelessWidget {
  //final TodoListItem listItem;

  final List<TodoListItem> todolist;

  TodoList(this.todolist);

  //TodoList({Key? key, required this.listItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children:
            todolist.map((listItem) => _listItems(context, listItem)).toList());
  }

  Widget _listItems(context, listItem) {
    bool? myBool = Provider.of<MyState>(context).myBool;

    return ListTile(
        leading: Consumer<MyState>(
          builder: (context, state, child) => Checkbox(
              value: myBool,
              onChanged: (value) {
                setState() {
                  myBool = value;
                }
              }),
        ),
        title: Consumer<MyState>(
            builder: (context, state, child) => Text(listItem.assignment)),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            var state = Provider.of<MyState>(context, listen: false);
            state.removeItem(listItem);
          },
        ));
  }
}

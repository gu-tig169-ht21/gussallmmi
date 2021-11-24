// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model.dart';

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

  Widget _listItems(context, TodoListItem listItem) {
    return ListTile(
        leading: Consumer<MyState>(
          builder: (context, state, child) => _checkBox(context, listItem),
        ),
        title: Consumer<MyState>(
            builder: (context, state, child) => Text(
                  listItem.assignment,
                  style: TextStyle(
                      decoration:
                          listItem.isDone ? TextDecoration.lineThrough : null),
                )),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            var state = Provider.of<MyState>(context, listen: false);
            state.removeItem(listItem);
          },
        ));
  }

  Widget _checkBox(context, TodoListItem listItem) {
    return Checkbox(
        value: listItem.isDone,
        onChanged: (bool? newCheckboxValue) {
          if (newCheckboxValue != null) {
            var state = Provider.of<MyState>(context, listen: false);
            state.setMyBool(listItem, newCheckboxValue);
          }
        });
  }
}


/*
class MyCB extends StatelessWidget {
  bool? myBool = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(value: myBool, onChanged: (value) {});
  }
}
*/
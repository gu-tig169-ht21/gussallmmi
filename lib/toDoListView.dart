// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_first_app/main.dart';
import 'package:provider/provider.dart';
import './AddToListView.dart';
import 'ToDoList.dart';
import 'model.dart';

class TodoListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title:
              const Text("TIG169 TODO", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
          actions: [
            PopupMenuButton(
                onSelected: (int value) {
                  Provider.of<MyState>(context, listen: false)
                      .setFilterBy(value);
                },
                itemBuilder: (context) => [
                      PopupMenuItem(child: Text("ALL"), value: 1),
                      PopupMenuItem(child: Text("Done"), value: 2),
                      PopupMenuItem(child: Text("Not Done"), value: 3),
                    ])
          ]),
      body: Consumer<MyState>(
          builder: (context, state, child) =>
              TodoList(_filterList(state.todoList, state.filterBy))),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: Icon(
            Icons.add,
          ),
          onPressed: () async {
            var todoItem = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        AddToListView(TodoListItem(assignment: ""))));
            if (todoItem != null) {
              Provider.of<MyState>(context, listen: false).addItem(todoItem);
            }
          }),
    );
  }

  List<TodoListItem> _filterList(todoList, filterBy) {
    if (filterBy == 1) return todoList;

    if (filterBy == 2) {
      return todoList.where((listItem) => listItem.isDone == true).toList();
    }

    if (filterBy == 3) {
      return todoList.where((listItem) => listItem.isDone == false).toList();
    }

    return todoList;
  }
}

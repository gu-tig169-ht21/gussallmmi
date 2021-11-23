// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_first_app/TodoList.dart';
import 'package:provider/provider.dart';
import './AddToListView.dart';
import 'ToDoListView.dart';
import 'main.dart';
import 'model.dart';

class TodoListView extends StatelessWidget {
  //final TodoListItem listItem;

  //const TodoListView({Key? key, required this.listItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("TIG169 TODO", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          Container(
            margin: EdgeInsets.only(right: 40),
          ),
        ],
      ),
      body: Consumer<MyState>(
        builder: (context, state, child) => TodoList(state.todoList),
      ),
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

  /*  return ListView.builder(
        itemCount: listItem.assignment.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              _listItems(listItem.assignment[index]),
              Divider(
                thickness: 2,
              ),
            ],
          );
        });*/

}

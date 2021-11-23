//import 'dart:html';

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import './ToDoList.dart';
import './ToDoListView.dart';
import 'AddToListView.dart';
import 'model.dart';
import 'package:provider/provider.dart';

List<TodoListItem> todolist = [];

void main() {
  var state = MyState();
  runApp(ChangeNotifierProvider(create: (context) => state, child: MyApp()));
}

class MyApp extends StatelessWidget {
  //final TodoListItem listItem;

  //const MyApp({Key? key, required this.listItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ToDo App",
      home: TodoListView(), // MyClass(listItem: listItem),
    );
  }
}

/*
class MyClass extends StatelessWidget {
  //bool val = false;
  final TodoListItem listItem;

  const MyClass({Key? key, required this.listItem}) : super(key: key);

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
      body: TodoListView();
      
      
      
      
      
      
      
      Consumer<MyState>(
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
                    builder: (context) => AddToListView(listItem)));

            Provider.of<MyState>(context, listen: false).addItem(todoItem);
          }),
    );
  }


  Widget _checkBoxAlt(String assignment) {
    return Row(children: [
      MyCB(),
      Container(
        height: 30,
        width: 250,
        child: Text(
          assignment,
          style: TextStyle(fontSize: 25),
        ),
      ),
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {},
      )
    ]);
  }
}



class MyCB extends StatefulWidget {
  @override
  State<MyCB> createState() => _MyCBState();
}

class _MyCBState extends State<MyCB> {
  bool? _myBool = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: _myBool,
        onChanged: (value) {
          setState(() {
            _myBool = value;
          });
        });

        
  }
*/
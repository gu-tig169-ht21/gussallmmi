import 'dart:js';

import 'package:flutter/material.dart';
import './Api.dart';

class TodoListItem {
  String id;
  String assignment;
  bool isDone;

  TodoListItem({this.id = "", required this.assignment, this.isDone = false});

  static Map<String, dynamic> toJson(TodoListItem listItem) {
    return {
      "title": listItem.assignment,
      "done": listItem.isDone,
    };
  }

  factory TodoListItem.fromJson(Map<String, dynamic> json) {
    return TodoListItem(
      id: json['id'],
      assignment: json['title'],
      isDone: json['done'],
    );
  }
}

class MyState extends ChangeNotifier {
  List<TodoListItem> _todoList = [];

  List<TodoListItem> get todoList => _todoList;

  int _filterBy = 0;
  int get filterBy => _filterBy;

  Future getList() async {
    List<TodoListItem> todoList = (await Api.fetchData());
    _todoList = todoList;
    notifyListeners();
  }

  void addItem(TodoListItem listItem) async {
    _todoList = (await Api.addItems(listItem, context));
    notifyListeners();
  }

  void removeItem(TodoListItem listItem) async {
    _todoList = await Api.removeItems(listItem.id);
    notifyListeners();
  }

  void setMyBool(TodoListItem listItem, bool isDone) {
    listItem.isDone = isDone;
    notifyListeners();
  }

  void setFilterBy(int filterBy) {
    this._filterBy = filterBy;
    notifyListeners();
  }
}

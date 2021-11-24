import 'package:flutter/material.dart';

class TodoListItem {
  String assignment;
  bool isDone = false;

  TodoListItem({required this.assignment});
}

class MyState extends ChangeNotifier {
  List<TodoListItem> _todoList = [];

  List<TodoListItem> get todoList => _todoList;

  int _filterBy = 0;
  int get filterBy => _filterBy;

  void addItem(TodoListItem listItem) {
    todoList.add(listItem);
    notifyListeners();
  }

  void removeItem(TodoListItem listItem) {
    todoList.remove(listItem);
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

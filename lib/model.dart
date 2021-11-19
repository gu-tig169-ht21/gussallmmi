import 'package:flutter/material.dart';
import 'package:my_first_app/main.dart';

class TodoListItem {
  String assignment;

  TodoListItem({required this.assignment});
}

class MyState extends ChangeNotifier {
  bool? _myBool = false;
  bool? get myBool => _myBool;

  List<TodoListItem> listGetter = [];
  List<TodoListItem> get todoList => listGetter;

  void addItem(TodoListItem listItem) {
    listGetter.add(listItem);
    notifyListeners();
  }

  void removeItem(TodoListItem listItem) {
    listGetter.remove(listItem);
    notifyListeners();
  }
}

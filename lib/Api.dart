// ignore: file_names
// ignore_for_file: file_names

import 'dart:convert';

import './model.dart';
import 'package:http/http.dart' as http;

const API_KEY = 'f2f77690-acd8-49a5-8091-c0e41d349c5c';
const API_URL = 'https://todoapp-api-pyq5q.ondigitalocean.app';

class Api {
  static Future<List<TodoListItem>> addItems(TodoListItem listItem) async {
    Map<String, dynamic> json = TodoListItem.toJson(listItem);
    var body = jsonEncode(json);
    var response = await http.post(
      Uri.parse('$API_URL/todos?key=$API_KEY'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );
    print(body);
    body = response.body;
    var todolist = jsonDecode(body);

    return todolist
        .map<TodoListItem>((item) => TodoListItem.fromJson(item))
        .toList();
  }

  static Future deleteItem(String listItemId) async {
    var response = await http.delete(
        Uri.parse('$API_URL/todos/$listItemId?key=$API_KEY&_confirm=true'));
    var body = response.body;
    var todolist = jsonDecode(body);

    print(body);

    return todolist
        .map<TodoListItem>((item) => TodoListItem.fromJson(item))
        .toList();
  }

  static Future updateItem(TodoListItem listItem) async {
    Map<String, dynamic> json = TodoListItem.toJson(listItem);
    var body = jsonEncode(json);
    var listItemId = listItem.id;
    var response = await http.put(
      Uri.parse('$API_URL/todos/$listItemId?key=$API_KEY'),
      body: body,
      headers: {'Content-Type': 'Application/json'},
    );

    body = response.body;
    var list = jsonDecode(body);

    print(body);

    return list
        .map<TodoListItem>((item) => TodoListItem.fromJson(item))
        .toList();
  }

  static Future<List<TodoListItem>> fetchData() async {
    var response = await http.get(Uri.parse('$API_URL/todos/?key=$API_KEY'));
    String body = response.body;
    var json = jsonDecode(body);

    return json
        .map<TodoListItem>((item) => TodoListItem.fromJson(item))
        .toList();
  }
}

// ignore: file_names
// ignore_for_file: file_names

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:my_first_app/main.dart';
import 'package:my_first_app/toDoList.dart';
import 'package:provider/provider.dart';

import './model.dart';
import 'package:http/http.dart' as http;

const API_KEY = '05944042-e5cf-4ff7-91c9-074b07e5dd3b';
const API_URL = 'https://todoapp-api-pyq5q.ondigitalocean.app/';

class Api {
  static Future<List<TodoListItem>> updateListItems(
      TodoListItem listItem, String id, context) async {
    var response = await http.put(
      Uri.parse('$API_URL/todos/$id?key=$API_KEY'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(<String, dynamic>{
        'title': listItem.assignment,
        'done': listItem.isDone
      }),
    );

    if (response.statusCode == 200) {
    } else {
      throw Exception("Failed to update item");
    }
  }

  static Future<TodoListItem> addItems(TodoListItem listItem, context) async {
    var response = await http.post(Uri.parse('$API_URL/todos/$API_KEY'),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(<String, String>{
          'title': listItem.assignment,
        }));

    if (response.statusCode == 201) {

      return 
    } else {
      throw Exception("Failed to add item");
    }
  }

  static Future removeItems(String id) async {
    var response = await http.delete(
      Uri.parse('$API_URL/todos/$id?key=$API_KEY'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    List<dynamic> body = jsonDecode(response.body);

    print(body);

    if (response.statusCode == 200) {
      List<TodoListItem> todoList =
          body.map((item) => TodoListItem.fromJson(item)).toList();
      return todoList;
    }
  }

  static Future<List<TodoListItem>> fetchData() async {
    var response = await http.get(Uri.parse(API_URL));

    if (response.statusCode == 200) {
    } else {
      throw Exception("Failed to fetch data");
    }
  }
}

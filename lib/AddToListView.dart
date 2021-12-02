// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'model.dart';
import 'package:http/http.dart' as http;

class AddToListView extends StatefulWidget {
  final TodoListItem listItem;

  AddToListView(this.listItem);

  @override
  State<AddToListView> createState() => _AddToListViewState(listItem);
}

class _AddToListViewState extends State<AddToListView> {
  String assignment = "";
  TextEditingController controller = TextEditingController();

  _AddToListViewState(TodoListItem listItem) {
    this.assignment = listItem.assignment;

    controller.addListener(() {
      setState(() {
        assignment = controller.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("TIG169 TODO"),
        ),
        body: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "What are you going to do?"),
                )),
            Row(
              children: [
                Container(
                  width: 150,
                ),
                IconButton(
                    onPressed: () {
                      _doStuff();
                      Navigator.pop(
                          context, TodoListItem(assignment: assignment));
                    },
                    icon: Icon(Icons.add)),
                Text("Add"),
                Container(
                  width: 125,
                )
              ],
            )
          ],
        ));
  }

  void _doStuff() async {
    var result = await _fetchStuffFromInternet();
    print(result);
  }

  Future<String> _fetchStuffFromInternet() async {
    http.Response response = await http
        .get(Uri.parse("https://todoapp-api-pyq5q.ondigitalocean.app/"));
    return response.body;
  }
}

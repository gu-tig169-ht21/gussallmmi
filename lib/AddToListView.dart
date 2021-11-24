// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'model.dart';

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
}

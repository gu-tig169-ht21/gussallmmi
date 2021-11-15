//import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hello",
      home: MyClass(),
    );
  }
}

class MyClass extends StatelessWidget {
  bool val = false;

  var index;

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
      body: _list(),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: Icon(
            Icons.add,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SecondView()));
          }),
    );
  }

  Widget _list() {
    var assignment = [
      "Write a book",
      "Do homework",
      "Tidy room",
      "Watch TV",
      "Nap",
      "Shop groceries",
      "Have fun",
      "Meditate",
    ];
    return ListView.builder(
        itemCount: assignment.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              _listItems(assignment[index]),
              Divider(
                thickness: 2,
              ),
            ],
          );
        } //=> _listItems(assignment[index]),

        );
  }

  Widget _listItems(assignmentTitle) {
    return ListTile(
      leading: MyCB(),
      title: Text(assignmentTitle),
      trailing: IconButton(
        icon: Icon(Icons.close),
        onPressed: () {},
      ),
    );
  }

/*
  Widget _listItem() {
    return ListView(
      children: [
        _listTile("Write a book"),
        _listTile("Do homework"),
        _listTile("Tidy room"),
        _listTile("Watch TV"),
        _listTile("Nap"),
        _listTile("Shop groceries"),
        _listTile("Have fun"),
        _listTile("Meditate"),
      ],
    );
  }

  Widget _listTile(String assignment) {
    return ListTile(
      leading: MyCB(),
      title: Text(assignment),
      trailing: IconButton(
        icon: Icon(Icons.close),
        onPressed: () {},
      ),
    );
  }
*/
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
}

class SecondView extends StatelessWidget {
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
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "What are you going to do?"),
                )),
            Row(
              children: [
                Container(
                  width: 150,
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.add)),
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

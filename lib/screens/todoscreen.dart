import 'package:flutter/material.dart';

class ToDoScreen extends StatelessWidget {
  const ToDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: const ToDoList(),
    );
  }
}

class ToDoList extends StatelessWidget {
  const ToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        ListTile(
          title: Text('Buy food'),
        ),
        ListTile(
          title: Text('Buy food'),
        ),
        ListTile(
          title: Text('Buy food'),
        ),
      ],
    );
  }
}

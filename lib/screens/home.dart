import 'package:flutter/material.dart';
import 'package:todo_app/screens/todoscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List',
            style: TextStyle(color: Colors.white, fontSize: 24),
            textAlign: TextAlign.center),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: const ToDoScreen(),
    );
  }
}

// This file contains the code for the ToDoScreen

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({Key? key}) : super(key: key);

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  List<Todo> todos = [
    Todo(title: 'Learn Flutter'),
    Todo(title: 'Build Todo App'),
    Todo(title: 'Deploy to App Store'),
  ];

  // Function to add a new todo
  void _addTodo() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController controller = TextEditingController();

        return AlertDialog(
          title: const Text('Add Todo'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Enter your todo'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  String title = controller.text;
                  if (title.isNotEmpty) {
                    todos.add(Todo(title: title));
                  }
                });
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _deleteTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  // Function to edit a todo
  void _editTodo(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController controller = TextEditingController();
        controller.text = todos[index].title;

        return AlertDialog(
          title: const Text('Edit Todo'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Enter your todo'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  String newTitle = controller.text;
                  if (newTitle.isNotEmpty) {
                    todos[index].title = newTitle;
                  }
                });
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        centerTitle: true,
        backgroundColor: Colors.deepPurple[400],
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // search functionality
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_alt),
            onPressed: () {
              //filter functionality
            },
          ),
        ],
        title: const Text(
          'Todo List',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            final todo = todos[index];
            return Dismissible(
              key: Key(todo.title),
              onDismissed: (direction) {
                _deleteTodo(index);
              },
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20.0),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              child: Card(
                elevation: 3.0,
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: ListTile(
                  title: Text(
                    todo.title,
                    style: TextStyle(
                      fontSize: 18.0,
                      decoration: todo.isCompleted
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                  leading: Checkbox(
                    value: todo.isCompleted,
                    onChanged: (bool? value) {
                      setState(() {
                        todo.isCompleted = value!;
                      });
                    },
                  ),
                  onTap: () {
                    _editTodo(index);
                  },
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodo,
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Todo {
  String title;
  bool isCompleted;
  String category;

  Todo({
    required this.title,
    this.isCompleted = false,
    this.category = 'Uncategorized',
  });
}


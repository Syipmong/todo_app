import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

final player = AudioPlayer();
class _ToDoScreenState extends State<ToDoScreen> {
  List<Todo> todos = [
    Todo(
      title: 'Add more Todo by pressing + button',
      creationDate: DateTime.now(),
    ),
    Todo(
      title: 'Tap on a todo to edit it',
      creationDate: DateTime.now(),
    ),
    Todo(
      title: 'Swipe left or right to delete',
      creationDate: DateTime.now(),
    ),
    Todo(
      title: 'Check the todo checkbox to mark complete',
      creationDate: DateTime.now(),
      isCompleted: true,
      completionDate: DateTime.utc(2024,01,24,4,11,48)
    ),

  ];

  // Function to add a new todo
  void _addTodo() {
    TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
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
                    todos.add(Todo(
                      title: title,
                      creationDate: DateTime.now(),
                    ));
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

  // void _completeTodo() {
  //   setState(() async {
  //     await player.play('assets/sounds/' as Source);
  //   });
  // }

  // Function to edit a todo
  void _editTodo(int index) {
    TextEditingController controller = TextEditingController();
    controller.text = todos[index].title;

    showDialog(
      context: context,
      builder: (BuildContext context) {
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
                // filter functionality
              },
            ),
          ],
          title: const Row(
            children: [
              Icon(FontAwesomeIcons.listCheck),
              SizedBox(width: 8,),
              Text('To Do'),
            ],
          )
      ),
      body: todos.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'No todos yet!',
              style: TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: _addTodo,
              child: const Text('Add Todo'),
            ),
          ],
        ),
      )
          : Column(
        children: [
          Expanded(
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
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            todo.title,
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.deepPurple,
                              decoration: todo.isCompleted
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Created: ${todo.creationDate.toString().split('.')[0]}',
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          ),
                          if (todo.isCompleted && todo.completionDate != null)
                            Text(
                              'Completed: ${todo.completionDate}',
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey,
                              ),
                            ),
                        ],
                      ),
                      leading: Checkbox(
                        value: todo.isCompleted,
                        onChanged: (bool? value) {
                          setState(() {
                            todo.isCompleted = value!;
                            if (value == true) {
                              todo.completionDate = DateTime.now();
                            } else {
                              todo.completionDate = null;
                            }
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
          Container(
            padding: const EdgeInsets.all(8.0),
            color: Theme.of(context).brightness == Brightness.light ? Colors.grey[300] : Colors.grey[700], // Adjust color based on theme brightness
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.check_circle, color: Colors.green),
                const SizedBox(width: 8),
                Text(
                  '${todos.where((todo) => !todo.isCompleted).length} Remaining',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white, // Adjust text color based on theme brightness
                  ),
                ),
              ],
            ),
          ),

        ],
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
  DateTime creationDate;
  DateTime? completionDate;

  Todo({
    required this.title,
    this.isCompleted = false,
    required this.creationDate,
    this.completionDate,
  });
}

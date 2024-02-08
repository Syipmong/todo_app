import 'package:flutter/material.dart';
import 'package:todo_app/screens/todoscreen.dart';
import 'package:todo_app/screens/notescreen.dart'; // Import the NotesScreen

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // Define a list of screens to be displayed in the bottom navigation bar
  final List<Widget> _screens = [
    const ToDoScreen(),
    const NotesScreen(), // Add NotesScreen here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todo',
          style: TextStyle(color: Colors.white, fontSize: 24),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: _screens[_currentIndex], // Display the current screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the current index when tapped
          });
        },
        items: const [
         BottomNavigationBarItem(
            icon: Icon(Icons.check_box),
            label: 'Todo',
            tooltip: 'Todo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: 'Notes',
            tooltip: 'Notes',
          ),
        ],
      ),
    );
  }
}

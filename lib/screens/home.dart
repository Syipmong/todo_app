import 'package:flutter/material.dart';
import 'package:todo_app/screens/setting.dart';
import 'package:todo_app/screens/todoscreen.dart';
import 'package:todo_app/screens/notescreen.dart'; // Import the NotesScreen

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // Define a list of screens to be displayed in the bottom navigation bar
  final List<Widget> _screens = [
    const ToDoScreen(),
    const NotesScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: UserAccountsDrawerHeader(
                otherAccountsPictures: [
                  CircleAvatar(
                    child: FlutterLogo(size: 42.0),
                  ),
                CircleAvatar(
                  child: FlutterLogo(size: 42.0),
                ),
                ],
                currentAccountPicture: CircleAvatar(
                  child: FlutterLogo(size: 42.0),
                ),
                margin: EdgeInsets.zero,
                accountName: Text("John Doe"),
                accountEmail: Text('User@gmail.com'),
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
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
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            tooltip: 'Settings',
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  ThemeMode _themeMode = ThemeMode.system;
  Brightness _statusBarBrightness = Brightness.light;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'), // 'child' argument is placed last
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Theme',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: const Text('Light Mode'),
              leading: Radio(
                value: ThemeMode.light,
                groupValue: _themeMode,
                onChanged: (value) {
                  setState(() {
                    _themeMode = value as ThemeMode;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Dark Mode'),
              leading: Radio(
                value: ThemeMode.dark,
                groupValue: _themeMode,
                onChanged: (value) {
                  setState(() {
                    _themeMode = value as ThemeMode;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'System Overlay Style',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SwitchListTile(
              title: const Text('Light Status Bar Icons'),
              value: _statusBarBrightness == Brightness.light,
              onChanged: (value) {
                setState(() {
                  _statusBarBrightness = value ? Brightness.light : Brightness.dark;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

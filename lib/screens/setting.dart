import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}
class _SettingsScreenState extends State<SettingsScreen> {
  ThemeMode _themeMode = ThemeMode.system;
  Brightness _statusBarBrightness = Brightness.light;
  bool _notificationsEnabled = true;
  bool _useCustomTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
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
          ListTile(
            title: const Text('System Theme'),
            leading: Radio(
              value: ThemeMode.system,
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
            'Customization',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SwitchListTile(
            title: const Text('Custom Theme'),
            value: _useCustomTheme,
            onChanged: (value) {
              setState(() {
                _useCustomTheme = value;
              });
            },
          ),

          const SizedBox(height: 20),
          const Text(
            'Notifications',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SwitchListTile(
            title: const Text('Enable Notifications'),
            value: _notificationsEnabled,
            onChanged: (value) {
              setState(() {
                _notificationsEnabled = value;
              });
            },
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
                _statusBarBrightness =
                value ? Brightness.light : Brightness.dark;
              });
            },
          ),
        ],
      ),
    );
  }
}

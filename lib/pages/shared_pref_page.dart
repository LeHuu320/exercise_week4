import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefPage extends StatefulWidget {
  @override
  _SharedPrefPageState createState() => _SharedPrefPageState();
}

class _SharedPrefPageState extends State<SharedPrefPage> {
  final TextEditingController _nameController = TextEditingController();
  String _display = '';

  Future<void> _saveName() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', _nameController.text);
    await prefs.setInt('saved_at', DateTime.now().millisecondsSinceEpoch);
  }

  Future<void> _showName() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('username');
    setState(() => _display = name ?? 'No data found');
  }

  Future<void> _clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    await prefs.remove('saved_at');
    setState(() => _display = '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shared Preferences')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "Enter name"),
            ),
            SizedBox(height: 12),
            Row(
              children: [
                ElevatedButton(onPressed: _saveName, child: Text("Save Name")),
                SizedBox(width: 8),
                ElevatedButton(onPressed: _showName, child: Text("Show Name")),
                SizedBox(width: 8),
                ElevatedButton(onPressed: _clear, child: Text("Clear")),
              ],
            ),
            SizedBox(height: 20),
            Text(_display),
          ],
        ),
      ),
    );
  }
}

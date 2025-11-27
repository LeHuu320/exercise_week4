import 'package:flutter/material.dart';
import 'pages/contact_list_page.dart';
import 'pages/grid_example.dart';
import 'pages/shared_pref_page.dart';
import 'pages/async_demo.dart';
import 'pages/factorial_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercise Week 4',
      debugShowCheckedModeBanner: false,
      home: const MenuPage(),
    );
  }
}

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lab Exercises")),
      body: ListView(
        children: [
          ListTile(
            title: const Text("1. Contact List"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ContactListPage()),
            ),
          ),
          ListTile(
            title: const Text("2. Grid Example"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => GridExample()),
            ),
          ),
          ListTile(
            title: const Text("3. Shared Preferences"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SharedPrefPage()),
            ),
          ),
          ListTile(
            title: const Text("4. Async Demo"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AsyncDemo()),
            ),
          ),
          ListTile(
            title: const Text("5. Factorial (Isolate)"),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => FactorialPage()),
            ),
          ),
        ],
      ),
    );
  }
}

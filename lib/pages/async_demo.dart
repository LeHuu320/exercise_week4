import 'package:flutter/material.dart';

class AsyncDemo extends StatefulWidget {
  const AsyncDemo({super.key});

  @override
  _AsyncDemoState createState() => _AsyncDemoState();
}

class _AsyncDemoState extends State<AsyncDemo> {
  String _text = "Loading user...";

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      if (!mounted) return;
      setState(() => _text = "User loaded successfully!");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Async Demo")),
      body: Center(child: Text(_text, style: TextStyle(fontSize: 20))),
    );
  }
}

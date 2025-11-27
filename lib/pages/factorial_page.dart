import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:math';

BigInt factorial(int n) {
  BigInt res = BigInt.one;
  for (int i = 1; i <= n; i++) {
    res *= BigInt.from(i);
  }
  return res;
}

class FactorialPage extends StatefulWidget {
  const FactorialPage({super.key});

  @override
  _FactorialPageState createState() => _FactorialPageState();
}

class _FactorialPageState extends State<FactorialPage> {
  bool loading = false;
  BigInt? result;

  Future<void> runFactorial() async {
    setState(() => loading = true);
    result = await compute(factorial, 30000);
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Factorial Isolate")),
      body: Center(
        child: loading
            ? CircularProgressIndicator()
            : result == null
            ? Text("Press button to calculate 30000!")
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Done!", style: TextStyle(fontSize: 20)),
                  SizedBox(height: 10),
                  Text(
                    "Số chữ số: ${result.toString().length}",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: runFactorial,
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}

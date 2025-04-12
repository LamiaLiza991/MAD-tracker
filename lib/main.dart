import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Big Text', style: TextStyle(fontSize: 30)),
              Text('Bold Text', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Red Text', style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
      ),
    );
  }
}

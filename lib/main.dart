import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Local Image")),
        body: Center(child: Image.asset("assets/images/sample.jpg")),
      ),
    );
  }
}

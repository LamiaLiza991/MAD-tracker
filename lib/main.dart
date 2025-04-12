import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final List<String> items = List.generate(10, (i) => 'Item ${i + 1}');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Swipe List")),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: Key(items[index]),
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 20),
                child: Icon(Icons.delete, color: Colors.white),
              ),
              secondaryBackground: Container(
                color: Colors.blue,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 20),
                child: Icon(Icons.edit, color: Colors.white),
              ),
              onDismissed: (direction) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${items[index]} dismissed')),
                );
              },
              child: ListTile(title: Text(items[index])),
            );
          },
        ),
      ),
    );
  }
}

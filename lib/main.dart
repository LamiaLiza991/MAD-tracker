import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final List<Map<String, String>> items = List.generate(
    5,
    (index) => {
      'title': 'Title $index',
      'subtitle': 'Subtitle $index',
      'desc': 'This is description $index',
      'image': 'https://via.placeholder.com/150',
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Custom Cards")),
        body: ListView(
          children: items.map((item) => CustomCard(item)).toList(),
        ),
      ),
    );
  }
}

class CustomCard extends StatefulWidget {
  final Map<String, String> data;

  CustomCard(this.data);

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _isTapped = !_isTapped),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _isTapped ? Colors.blue.shade50 : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey.shade300)],
        ),
        child: Row(
          children: [
            Image.network(widget.data['image']!, width: 50, height: 50),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.data['title']!,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(widget.data['subtitle']!),
                  Text(
                    widget.data['desc']!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

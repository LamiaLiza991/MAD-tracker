import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CustomDrawerApp());
  }
}

class CustomDrawerApp extends StatefulWidget {
  @override
  _CustomDrawerAppState createState() => _CustomDrawerAppState();
}

class _CustomDrawerAppState extends State<CustomDrawerApp>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _drawerAnimation;
  bool _isDrawerOpen = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _drawerAnimation = Tween<Offset>(
      begin: Offset(-1.0, 0),
      end: Offset.zero,
    ).animate(_controller);
  }

  void _toggleDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
      _isDrawerOpen ? _controller.forward() : _controller.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text("Custom Drawer"),
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: _toggleDrawer,
            ),
          ),
          body: Center(child: Text("Main Content")),
        ),
        SlideTransition(
          position: _drawerAnimation,
          child: SafeArea(
            child: Container(
              width: 250,
              color: Colors.white,
              child: Column(
                children: [
                  ListTile(title: Text("Option 1")),
                  ListTile(title: Text("Option 2")),
                  ListTile(title: Text("Close"), onTap: _toggleDrawer),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Homepage(),
      ),
    );

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.purple,
        elevation: 0,
        leading: Icon(
          Icons.notes,
          size: 30,
          color: Colors.white,
        ),
        actions: [
          Icon(
            Icons.info,
            size: 30,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

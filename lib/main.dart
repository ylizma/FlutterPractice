import 'package:flutter/material.dart';
import './maindrawer.dart';



void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First App'),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Text(
          'Hello',
          style: TextStyle(fontSize: 30),
          textAlign: TextAlign.center,
        ),
      ),
      drawer: MainDrawer() ,
    );
  }
}

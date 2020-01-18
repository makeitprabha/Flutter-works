import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String name;
  final int x;

  const SecondPage({@required this.name, @required this.x});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Page'),
      ),
      body: Center(
        child: Container(
          child: Text("User name: $name, age: $x"),
        ),
      ),
    );
  }
}

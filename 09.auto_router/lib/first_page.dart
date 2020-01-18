import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  final String name;
  const FirstPage({@required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Container(
          child: Text(this.name),
        ),
      ),
    );
  }
}

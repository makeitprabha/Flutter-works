import 'package:flutter/material.dart';

void main() => runApp(MyFirstPage());

class MyFirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('First Page'),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){}),
      ),
      body: Center(
        child: Container(
          child: Text('My First Page', style: TextStyle(fontSize: 25)),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

void run(){
  runApp(MyPageOne());
}

class MyPageOne extends StatefulWidget {
  MyPageOne ({Key key}) : super (key: key);
  @override
  _MyPageOneState createState() => _MyPageOneState();
}

class _MyPageOneState extends State<MyPageOne> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: new Text('Page one'),
      ),
    );
  }
}
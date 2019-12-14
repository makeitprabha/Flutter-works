import 'package:flutter/material.dart';

void run() {
  runApp(MyPageTwo());
}

class MyPageTwo extends StatefulWidget {
  MyPageTwo({Key key}) : super(key: key);
  @override
  _MyPageTwoState createState() => _MyPageTwoState();
}

class _MyPageTwoState extends State<MyPageTwo> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: new Text(
          'Page two',
          style: TextStyle(fontSize: 25.0),
        ),
      ),
    );
  }
}

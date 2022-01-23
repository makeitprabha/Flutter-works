import 'package:bottom_navigation/page_one.dart';
import 'package:bottom_navigation/page_two.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyBottomWidget(),
    );
  }
}

class MyBottomWidget extends StatefulWidget {
  MyBottomWidget({Key key}) : super(key: key);
  @override
  _MyBottomWidgetState createState() => _MyBottomWidgetState();
}

class _MyBottomWidgetState extends State<MyBottomWidget> {
  int _page = 0;
  @override
  Widget build(BuildContext context) {
    final _pagination = [
      MyPageOne(),
      MyPageTwo(),
      MyPageTwo(),
    ];
    return Scaffold(
      drawer: new Drawer(
        child: new Text('data'),
        elevation: 20.0,
      ),
      appBar: new AppBar(
        title: new Text('My Bottom Widget'),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        backgroundColor: Colors.transparent,
        color: Colors.purple,
        items: <Widget>[
          Icon(
            Icons.add,
            size: 30.0,
            color: Colors.white,
          ),
          Icon(
            Icons.remove,
            size: 30.0,
            color: Colors.white,
          ),
          Icon(
            Icons.refresh,
            size: 30.0,
            color: Colors.white,
          ),
        ],
        animationCurve: Curves.easeInOutQuint,
        height: 50.0,
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: _pagination[_page],
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

// Main method
void main() => runApp(MySplashScreen());

class MySplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Splash Screen with Shimmer effect',
      theme: ThemeData(backgroundColor: Colors.red),
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  void initState() {
    super.initState();
    print('Started my page');
    Timer(Duration(seconds: 10), callback);
  }

  // Can do page navigation
  void callback() {
    print('Timer ends.....');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
          child: Shimmer.fromColors(
        direction: ShimmerDirection.rtl,
        baseColor: Colors.transparent,
        highlightColor: Colors.white,
        period: Duration(seconds: 2),
        child: Text(
          'My First Application',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 25, color: Colors.red),
        ),
      )),
    );
  }
}

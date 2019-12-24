import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_todo/ui/widgets/text.dart';
import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), callback);
  }

  void callback() {
    Navigator.of(context).pushReplacement(
        new MaterialPageRoute(builder: (_) => MyHome(), maintainState: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.deepPurple,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/todo.png'),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextWidget(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                text: "My Todo",
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

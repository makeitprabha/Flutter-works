import 'package:flutter/material.dart';

void main() {
  runApp(IntlUsingJson());
}

class IntlUsingJson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntlPage(),
    );
  }
}


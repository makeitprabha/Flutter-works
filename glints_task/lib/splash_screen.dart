import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/presentation/sign_in.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), _navigationCallback);
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Text(
            'Glints Task App',
            style: TextStyle(fontSize: 35.0),
          ),
        ),
      ),
    );
  }

  void _navigationCallback() {
    Get.off(
      SignInPage(),
    );
  }
}

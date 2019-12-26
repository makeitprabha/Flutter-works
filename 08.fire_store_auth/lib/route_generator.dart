import 'package:fire_store_auth/fire_auth.dart';
import 'package:fire_store_auth/home_page.dart';
import 'package:fire_store_auth/login_page.dart';
import 'package:fire_store_auth/sign_up.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generator(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return new MaterialPageRoute(builder: (_) => FirestoreAuth());
      case "/login":
        return new MaterialPageRoute(builder: (_) => LoginPage());
      case "/homepage":
        return new MaterialPageRoute(builder: (_) => HomePage());
      case "/signup":
        return new MaterialPageRoute(builder: (_) => SignUp());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

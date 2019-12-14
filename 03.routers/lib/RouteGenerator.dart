import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:routers/firstpage.dart';
import 'package:routers/main.dart';

class RouteGnerator {
  static Route<dynamic> generateRouteSettings(RouteSettings settings) {
    switch (settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/first':
        return MaterialPageRoute(builder: (_) => FirstPage());
    }
  }
}
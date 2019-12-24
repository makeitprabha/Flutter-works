import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_todo/core/models/screen_route.dart';
import 'package:my_todo/ui/views/add_new.dart';
import 'package:my_todo/ui/views/splash_screen.dart';
import 'package:my_todo/ui/views/todo_details.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/new':
        return MaterialPageRoute(
            builder: (_) => AddNew(), maintainState: false);
      case '/details':
        ScreenArguments args = settings.arguments;

        return MaterialPageRoute(
          builder: (_) => ToDoDetails(
            colorPosition: args.position,
            groupListItems: args.listItems,
          ),
          maintainState: false,
        );

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

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/router_utils.dart';
import 'package:auto_router/initial_page.dart';
import 'package:auto_router/first_page.dart';
import 'package:auto_router/second_page.dart';

class Router {
  static const initialPage = '/';
  static const firstPage = '/firstPage';
  static const secondPage = '/secondPage';
  static GlobalKey<NavigatorState> get navigatorKey =>
      getNavigatorKey<Router>();
  static NavigatorState get navigator => navigatorKey.currentState;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Router.initialPage:
        return MaterialPageRoute(
          builder: (_) => InitialPage(),
          settings: settings,
        );
      case Router.firstPage:
        if (hasInvalidArgs<String>(args, isRequired: true)) {
          return misTypedArgsRoute<String>(args);
        }
        final typedArgs = args as String;
        return MaterialPageRoute(
          builder: (_) => FirstPage(name: typedArgs),
          settings: settings,
        );
      case Router.secondPage:
        if (hasInvalidArgs<SecondPageArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<SecondPageArguments>(args);
        }
        final typedArgs = args as SecondPageArguments;
        return MaterialPageRoute(
          builder: (_) => SecondPage(name: typedArgs.name, x: typedArgs.x),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

//**************************************************************************
// Arguments holder classes
//***************************************************************************

//SecondPage arguments holder class
class SecondPageArguments {
  final String name;
  final int x;
  SecondPageArguments({@required this.name, @required this.x});
}

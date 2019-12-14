import 'package:flutter/material.dart';
import 'package:routers/RouteGenerator.dart';

void main() => runApp(MyRouterApp());

class MyRouterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Router Example',
      initialRoute: '/',
      onGenerateRoute: RouteGnerator.generateRouteSettings,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Home Page'),
      ),
      body: Center(
        child: Container(
          child: RaisedButton(
            child: Text('First Page'),
            onPressed: () {
              Navigator.of(context).pushNamed('/first');
            },
          ),
        ),
      ),
    );
  }
}

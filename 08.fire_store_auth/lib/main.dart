import 'package:fire_store_auth/route_generator.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyFirestoreAuth());

class MyFirestoreAuth extends StatelessWidget {
  const MyFirestoreAuth({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generator,
    );
  }
}

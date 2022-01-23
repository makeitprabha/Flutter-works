import 'package:dio_api/core/bloc/user_bloc.dart';
import 'package:dio_api/ui/widgets/user_widgets.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DioSample(),
      theme: ThemeData(
        primaryColor: Colors.white,
        textTheme: TextTheme(
            title: TextStyle(fontSize: 30, color: Colors.white),
            subtitle: TextStyle(fontSize: 20, color: Colors.white),
            body1: TextStyle(fontSize: 15, color: Colors.white)),
      ),
      title: 'Dio Sample',
    );
  }
}

class DioSample extends StatefulWidget {
  DioSample({Key key}) : super(key: key);

  @override
  _DioSampleState createState() => _DioSampleState();
}

class _DioSampleState extends State<DioSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: UserWidget(),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 0.7],
          colors: [
            Color(0xFFF12711),
            Color(0xFFf5af19),
          ],
        ),
      ),
    ));
  }
}

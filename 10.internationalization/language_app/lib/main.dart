import 'package:flutter/material.dart';
import 'package:language_app/ui/widgets/user_widgets.dart';

void main() {
  runApp(MyDioPage());
}

class MyDioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        textTheme: TextTheme(
            headline1: TextStyle(fontSize: 30, color: Colors.white),
            headline2: TextStyle(fontSize: 20, color: Colors.white),
            bodyText1: TextStyle(fontSize: 15, color: Colors.white)),
      ),
      home: DioSample(),
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
      appBar: AppBar(
        title: Text('Dio Sample'),
      ),
      body: Container(
        child: UserWidget(),
      ),
    );
  }
}

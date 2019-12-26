import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dahboard'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('You are logged in!!'),
              SizedBox(
                height: 25,
              ),
              OutlineButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut().then((onValue) {
                    Navigator.of(context).pushReplacementNamed("/login");
                  }).catchError((onError) {
                    print(onError);
                  });
                },
                child: Text('Sign Out'),
                borderSide: BorderSide(
                  color: Colors.red,
                  style: BorderStyle.solid,
                  width: 3.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: 'Email'),
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(hintText: 'Password'),
                onChanged: (value) {
                  setState(() {
                    _password = value;
                  });
                },
              ),
              SizedBox(
                height: 35,
              ),
              RaisedButton(
                onPressed: () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                    email: _email,
                    password: _password,
                  )
                      .then((onValue) {
                    Navigator.of(context).pushReplacementNamed("/homepage");
                  }).catchError((onError) {
                    print(onError);
                  });
                },
                child: Text("Login"),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 7,
              ),
              SizedBox(
                height: 20,
              ),
              Text("Don't have account?"),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed("/signup");
                },
                child: Text("Sign Up"),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 7,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

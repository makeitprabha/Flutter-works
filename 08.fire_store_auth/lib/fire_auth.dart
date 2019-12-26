import 'package:fire_store_auth/google_signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirestoreAuth extends StatelessWidget {
  const FirestoreAuth({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firestore Authentication"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("/login");
                },
                child: Text(
                  "Email Auth",
                ),
              ),
              FlatButton(
                onPressed: () {
                  signInWithGoogle().whenComplete(() {
                    Navigator.of(context).pushReplacementNamed('/homepage');
                  });
                },
                child: Text(
                  "Social token Auth with Google",
                ),
              ),
              FlatButton(
                onPressed: () {},
                child: Text(
                  "Phone Auth",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

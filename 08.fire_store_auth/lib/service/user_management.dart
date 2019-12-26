import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserManagement {
  createNewUser(context, user) {
    Firestore.instance.collection('/users').add({
      'email': user.email,
      'uid': user.uid,
    }).then((onValue) {
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacementNamed('/homepage');
    }).catchError((onError) {
      print(onError);
    });
  }
}

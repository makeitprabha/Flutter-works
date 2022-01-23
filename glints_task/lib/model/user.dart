import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? name;
  String? email;

  UserModel({
    this.id,
    this.name,
    this.email,
  });

  UserModel.fromDoc({required DocumentSnapshot doc}) {
    id = doc.id;
    name = doc["name"];
    email = doc["email"];
  }
}

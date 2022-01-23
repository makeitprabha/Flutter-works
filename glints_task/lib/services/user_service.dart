import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task/model/user.dart';

class UserService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<UserModel> createNewUser(UserModel user) async {
    await _firebaseFirestore.collection("users").doc(user.id).set({
      "authorId": user.id,
      "email": user.email,
      "name": user.email.toString().split("@")[0].toString(),
    });
    return user;
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class Tweet {
  late String documentId;
  late String text;
  late String name = '';
  late String emailId = '';
  late String authorId = '';
  late Timestamp createdOn;

  Tweet({
    required this.text,
    required this.documentId,
    required this.emailId,
    required this.authorId,
    required this.name,
  });

  Tweet.fromDoc({
    required DocumentSnapshot doc,
    required String email,
    required String userName,
    required String id,
  }) {
    documentId = doc.id;
    text = doc['text'];
    emailId = email;
    name = userName;
    authorId = id;
    createdOn = doc['createdOn'];
  }
}

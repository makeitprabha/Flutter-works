import 'package:cloud_firestore/cloud_firestore.dart';

class Tweet {
  String? authorId;
  String? text;
  Timestamp? timestamp;
  String? name;
  String? email;
  String? id;

  Tweet({
    this.authorId,
    this.text,
    this.timestamp,
    this.name,
    this.email,
    this.id,
  });

  factory Tweet.fromDoc(DocumentSnapshot doc) {
    return Tweet(
      id: doc.id,
      authorId: doc['authorId'],
      text: doc['text'],
      timestamp: doc['timestamp'],
      name: doc['name'],
      email: doc['email'],
    );
  }
}

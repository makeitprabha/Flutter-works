import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task/model/tweet.dart';

class TweetService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> fetchSpecificUserTweets(String userId) {
    return _firebaseFirestore
        .collection("users")
        .doc(userId)
        .collection("userTweets")
        // .orderBy('createdOn', descending: false)
        .snapshots();
  }

  Stream<QuerySnapshot> fetchAllUsersTweets() {
    return _firebaseFirestore.collection("users").snapshots();
  }

  createNewTweet(Tweet tweet) async {
    await _firebaseFirestore
        .collection('users')
        .doc(tweet.authorId)
        .collection('userTweets')
        .add({
      'authorId': tweet.authorId,
      'text': tweet.text,
      'createdOn': Timestamp.now(),
      "name": tweet.name,
      "email": tweet.emailId,
    });
  }

  updateTweet(Tweet tweet) async {
    return _firebaseFirestore
        .collection("users")
        .doc(tweet.authorId)
        .collection('userTweets')
        .doc(tweet.documentId)
        .update({
      'text': tweet.text,
      "createdOn": Timestamp.now(),
    });
  }

  deleteContact(Tweet tweet) async {
    await _firebaseFirestore
        .collection("users")
        .doc(tweet.authorId)
        .collection('userTweets')
        .doc(tweet.documentId)
        .delete();
  }
}

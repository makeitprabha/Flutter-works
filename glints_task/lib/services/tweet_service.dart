import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:task/model/tweet.dart';

class TweetService {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> fetchTweetsSpecificUser(String userId) {
    return _firebaseFirestore
        .collection("users")
        .doc(userId.toString())
        .collection('userTweets')
        .snapshots();
  }

  Stream<QuerySnapshot> fetchTweets() {
    return _firebaseFirestore.collection("users").snapshots();
  }

  Future<Tweet> createNewTweet(Tweet tweet) async {
    DocumentReference docRef = _firebaseFirestore
        .collection("users")
        .doc(tweet.id.toString())
        .collection('userTweets')
        .doc();
    await docRef.set({
      "id": tweet.id,
      'text': tweet.text,
      "timestamp": tweet.timestamp,
      "name": tweet.name,
      "email": tweet.email,
    });
    return tweet;
  }

  Future<Tweet> updateTweet(Tweet tweet) async {
    DocumentReference docRef = _firebaseFirestore
        .collection("users")
        .doc(tweet.id.toString())
        .collection('userTweets')
        .doc(tweet.authorId);

    await docRef.update({
      'text': tweet.text,
      "id": tweet.id,
      "timestamp": tweet.timestamp,
      "name": tweet.name,
      "email": tweet.email,
    });
    return tweet;
  }

  Future<Tweet> deleteContact(Tweet tweet) async {
    await _firebaseFirestore
        .collection("users")
        .doc(tweet.id.toString())
        .collection('userTweets')
        .doc(tweet.authorId)
        .delete();
    return tweet;
  }
}

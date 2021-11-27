import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:task/model/tweet.dart';
import 'package:task/services/tweet_service.dart';
import 'package:task/viewmodel/controller/firebase_auth_controller.dart';

class TweetController extends GetxController {
  static TweetController get to => Get.find();
  final TweetService _tweetService = TweetService();
  final RxList usersListFromFirebase = ([]).obs;
  final isLoading = false.obs;
  RxList tweetListFromService = ([]).obs;

  @override
  void onInit() async {
    super.onInit();
    usersListFromFirebase.clear();
    tweetListFromService.clear();
    await getUsersListFromFireBase();
  }

  Future<void> getUsersListFromFireBase() async {
    await _tweetService.fetchAllUsersTweets().forEach((querySnapshots) async {
      for (var tweets in querySnapshots.docs) {
        usersListFromFirebase.add(tweets.id);
      }
      getAllUserTweets();
    });
  }

  void getAllUserTweets() {
    for (int i = 0; i < usersListFromFirebase.length; i++) {
      getSpecificUserTweets(usersListFromFirebase[i]);
    }
  }

  void getSpecificUserTweets(String userId) async {
    tweetListFromService.clear();
    Stream<QuerySnapshot> _specificUserTweetSnapShot =
        await _tweetService.fetchSpecificUserTweets(userId);
    await _specificUserTweetSnapShot.forEach((querySnapshots) {
      for (var tweets in querySnapshots.docs) {
        final _tweetModel = Tweet.fromDoc(
          doc: tweets,
          email: tweets['email'],
          id: userId,
          userName: tweets['name'],
        );
        tweetListFromService.add(_tweetModel);
      }
    });
  }

  Stream<QuerySnapshot> fetchTweets() {
    Stream<QuerySnapshot> qSnapStream = _tweetService
        .fetchSpecificUserTweets(FirebaseAuthController.to.user!.uid);
    return qSnapStream;
  }

  void createTweet(Tweet tweet) async {
    try {
      await _tweetService.createNewTweet(tweet);
      isLoading(false);
      Get.back();
    } catch (e) {}
  }

  void deleteTweet(Tweet tweet) async {
    try {
      await _tweetService.deleteContact(tweet);
      isLoading(false);
      Get.back();
    } catch (e) {}
  }

  void updateTweet(Tweet tweet) async {
    try {
      await _tweetService.updateTweet(tweet);
      isLoading(false);
      Get.back();
    } catch (e) {}
  }
}

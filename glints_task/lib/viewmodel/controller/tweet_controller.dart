import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:task/model/tweet.dart';
import 'package:task/presentation/landing_page.dart';
import 'package:task/services/tweet_service.dart';
import 'package:task/viewmodel/controller/firebase_auth_controller.dart';

class TweetController extends GetxController {
  static TweetController get to => Get.find();
  final TweetService _tweetService = TweetService();
  final showProgress = false.obs;
  void setShowProgress(bool visible) async {
    showProgress.value = visible;
  }

  Stream<QuerySnapshot> fetchTweets() {
    Stream<QuerySnapshot> qSnapStream = _tweetService
        .fetchTweetsSpecificUser(FirebaseAuthController.to.user!.uid);
    return qSnapStream;
  }

  void createTweet(Tweet tweet) async {
    try {
      await _tweetService.createNewTweet(tweet);
      setShowProgress(false);
      Get.offAll(
        const LandingPage(),
        transition: Transition.rightToLeft,
      );
    } catch (e) {}
  }

  void deleteTweet(Tweet tweet) async {
    try {
      await _tweetService.deleteContact(tweet);
      setShowProgress(false);
      Get.back();
    } catch (e) {}
  }

  void updateTweet(Tweet tweet) async {
    try {
      await _tweetService.updateTweet(tweet);
      setShowProgress(false);
      Get.back();
    } catch (e) {}
  }
}

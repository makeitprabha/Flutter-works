import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/model/tweet.dart';
import 'package:task/model/user.dart';
import 'package:task/viewmodel/controller/app_controller.dart';
import 'package:task/viewmodel/controller/firebase_auth_controller.dart';
import 'package:task/viewmodel/controller/tweet_controller.dart';

import 'create_tweet_screen.dart';

class TweetContainer extends StatelessWidget {
  final Tweet tweet;
  final UserModel author;
  final String currentUserId;

  const TweetContainer({
    Key? key,
    required this.tweet,
    required this.author,
    required this.currentUserId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              RichText(
                text: TextSpan(
                  text: author.name.toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                  children: [
                    TextSpan(
                      text: '     ${author.email.toString()}',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.normal,
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(
            tweet.text.toString(),
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Get.to(
                        CreateTweetScreen(
                          status: 'update',
                          id: tweet.authorId.toString(),
                          text: tweet.text.toString(),
                        ),
                        transition: Transition.rightToLeft,
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      TweetController.to.deleteTweet(tweet);
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.power_settings_new_sharp,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      AppController.to.setShowProgress(true);
                      FirebaseAuthController.to.userSignOut();
                    },
                  ),
                ],
              ),
              Text(
                tweet.timestamp!.toDate().toString().substring(0, 19),
                style: const TextStyle(color: Colors.grey),
              )
            ],
          ),
          const SizedBox(height: 10),
          const Divider()
        ],
      ),
    );
  }
}

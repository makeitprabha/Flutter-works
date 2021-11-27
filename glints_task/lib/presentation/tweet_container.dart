import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/model/tweet.dart';
import 'package:task/presentation/create_tweet_screen.dart';
import 'package:task/viewmodel/controller/firebase_auth_controller.dart';
import 'package:task/viewmodel/controller/tweet_controller.dart';

class TweetContainer extends StatelessWidget {
  final Tweet tweet;

  const TweetContainer({
    Key? key,
    required this.tweet,
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
                  text: tweet.name.toString(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                  children: [
                    TextSpan(
                      text: '     ${tweet.emailId.toString()}',
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
                      if (FirebaseAuthController.to.user!.uid.toString() ==
                          tweet.authorId) {
                        Get.to(
                          CreateTweetScreen(
                            status: 'update',
                            tweet: tweet,
                          ),
                          transition: Transition.rightToLeft,
                        );
                      } else {
                        Get.snackbar(
                          'Failed',
                          "You are not eligible to edit this tweet!!",
                          backgroundColor: Colors.black,
                          snackPosition: SnackPosition.BOTTOM,
                          colorText: Colors.white,
                        );
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      if (FirebaseAuthController.to.user!.uid.toString() ==
                          tweet.authorId) {
                        TweetController.to.deleteTweet(tweet);
                        TweetController.to.onInit();
                      } else {
                        Get.snackbar(
                          "Failed!!",
                          "You are not eligible to delete this tweet!!",
                          backgroundColor: Colors.black,
                          snackPosition: SnackPosition.BOTTOM,
                          colorText: Colors.white,
                        );
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.power_settings_new_sharp,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      // if (FirebaseAuthController.to.user!.uid.toString() ==
                      //     tweet.authorId) {
                      Get.delete<TweetController>();
                      FirebaseAuthController.to.userSignOut();
                      // } else {
                      //   Get.snackbar(
                      //     'Failed',
                      //     "You are not eligible to click this tweet!!",
                      //     backgroundColor: Colors.black,
                      //     snackPosition: SnackPosition.BOTTOM,
                      //     colorText: Colors.white,
                      //   );
                      // }
                    },
                  ),
                ],
              ),
              Text(
                tweet.createdOn.toDate().toString().substring(0, 19),
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

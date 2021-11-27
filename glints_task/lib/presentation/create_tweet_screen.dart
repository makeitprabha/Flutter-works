import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/model/tweet.dart';
import 'package:task/viewmodel/controller/firebase_auth_controller.dart';
import 'package:task/viewmodel/controller/tweet_controller.dart';

class CreateTweetScreen extends StatefulWidget {
  final String status;
  final Tweet tweet;

  CreateTweetScreen({
    Key? key,
    required this.status,
    required this.tweet,
  }) : super(key: key);

  @override
  _CreateTweetScreenState createState() => _CreateTweetScreenState();
}

class _CreateTweetScreenState extends State<CreateTweetScreen> {
  final TextEditingController _tweetController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _tweetController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tweetController.text = widget.tweet.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Tweet',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: Obx(() {
        return AbsorbPointer(
          absorbing: TweetController.to.isLoading.value,
          child: Stack(
            children: [
              _buildUI(context),
              Center(
                child: Visibility(
                  visible: TweetController.to.isLoading.value,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildUI(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 20.0,
          ),
          TextField(
            controller: _tweetController,
            maxLength: 280,
            maxLines: 7,
            decoration: const InputDecoration(
              hintText: 'Enter your Tweet',
              helperText: 'Max character 280',
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              TweetController.to.isLoading(true);
              FirebaseFirestore.instance
                  .collection("users")
                  .doc(FirebaseAuthController.to.user!.uid.toString())
                  .get()
                  .then((value) {
                TweetController.to.tweetListFromService.clear();
                if (_tweetController.value.text.isNotEmpty) {
                  Tweet tweet = Tweet(
                    documentId: widget.tweet.documentId,
                    text: _tweetController.value.text,
                    name: value['name'],
                    emailId: value['email'],
                    authorId: value['authorId'],
                  );
                  if (widget.status == 'new') {
                    TweetController.to.createTweet(tweet);
                  } else {
                    TweetController.to.updateTweet(tweet);
                  }
                  TweetController.to.onInit();
                }
              });
            },
            child: const Text("Tweet"),
          ),
        ],
      ),
    );
  }
}

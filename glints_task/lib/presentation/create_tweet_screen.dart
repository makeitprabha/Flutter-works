import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/model/tweet.dart';
import 'package:task/viewmodel/controller/firebase_auth_controller.dart';
import 'package:task/viewmodel/controller/tweet_controller.dart';

class CreateTweetScreen extends StatefulWidget {
  final String status;
  final String id;
  final String text;
  const CreateTweetScreen({
    Key? key,
    required this.status,
    required this.id,
    required this.text,
  }) : super(key: key);

  @override
  _CreateTweetScreenState createState() => _CreateTweetScreenState();
}

class _CreateTweetScreenState extends State<CreateTweetScreen> {
  final _controller = Get.put(TweetController());
  final TextEditingController _tweetController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _tweetController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tweetController.text = widget.text;
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
          absorbing: _controller.showProgress.value,
          child: Stack(
            children: [
              _buildUI(context),
              Center(
                child: Visibility(
                  visible: _controller.showProgress.value,
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
    _controller.setShowProgress(false);
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
              _controller.setShowProgress(true);
              if (_tweetController.value.text.isNotEmpty) {
                Tweet tweet = Tweet(
                  authorId: widget.id.isEmpty ? '' : widget.id,
                  text: _tweetController.value.text,
                  id: FirebaseAuthController.to.user!.uid,
                  timestamp: Timestamp.fromDate(
                    DateTime.now(),
                  ),
                  name: FirebaseAuthController.to.user!.displayName,
                  email: FirebaseAuthController.to.user!.email,
                );
                if (widget.status == 'new') {
                  _controller.createTweet(tweet);
                } else {
                  _controller.updateTweet(tweet);
                }
              }
            },
            child: const Text("Tweet"),
          ),
        ],
      ),
    );
  }
}

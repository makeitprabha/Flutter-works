import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:task/model/tweet.dart';
import 'package:task/model/user.dart';
import 'package:task/presentation/create_tweet_screen.dart';
import 'package:task/presentation/tweet_container.dart';
import 'package:task/viewmodel/controller/firebase_auth_controller.dart';
import 'package:task/viewmodel/controller/tweet_controller.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final controller = Get.put(TweetController());

  Widget buildTweets(Tweet tweet, UserModel author) {
    return TweetContainer(
      tweet: tweet,
      author: author,
      currentUserId: tweet.authorId.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: _buildUI(),
        floatingActionButton: FloatingActionButton(
          elevation: 0.0,
          child: const Icon(Icons.add),
          onPressed: () {
            Get.to(
              const CreateTweetScreen(
                status: 'new',
                id: '',
                text: '',
              ),
              transition: Transition.rightToLeft,
            );
          },
        ),
      ),
    );
  }

  Widget _buildUI() {
    return StreamBuilder<QuerySnapshot>(
      stream: controller.fetchTweets(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> stream) {
        if (stream.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (stream.hasError) {
          return Center(child: Text(stream.error.toString()));
        }
        QuerySnapshot? querySnapshot = stream.data;

        return ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: querySnapshot!.size,
          itemBuilder: (context, index) {
            final item = querySnapshot.docs[index];
            Tweet tweet = Tweet(
              id: FirebaseAuthController.to.user!.uid.trim(),
              text: item['text'],
              authorId: item.id,
              timestamp: item['timestamp'],
              name: item['name'],
              email: item['email'],
            );
            UserModel author = UserModel.fromDoc(doc: item);
            return buildTweets(tweet, author);
          },
        );
      },
    );
  }
}

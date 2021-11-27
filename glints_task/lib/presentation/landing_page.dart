import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/model/tweet.dart';
import 'package:task/presentation/create_tweet_screen.dart';
import 'package:task/presentation/tweet_container.dart';
import 'package:task/viewmodel/controller/tweet_controller.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final controller = Get.put(TweetController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              _buildUI(),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 0.0,
          child: const Icon(Icons.add),
          onPressed: () {
            Get.to(
              CreateTweetScreen(
                status: 'new',
                tweet: Tweet(
                    documentId: '',
                    text: '',
                    name: '',
                    authorId: '',
                    emailId: ''),
              ),
              transition: Transition.rightToLeft,
            );
          },
        ),
      ),
    );
  }

  Widget _buildUI() {
    return Obx(
      () {
        return ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: controller.tweetListFromService.length,
          itemBuilder: (context, index) {
            final item = controller.tweetListFromService[index];
            return TweetContainer(
              tweet: item,
            );
          },
        );
      },
    );
  }
}

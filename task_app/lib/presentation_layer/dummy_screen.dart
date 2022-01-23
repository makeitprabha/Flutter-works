import 'package:flutter/material.dart';

class DummyPages extends StatelessWidget {
  const DummyPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Sample Pages"),
      ),
      body: const Center(
        child: Text("In Progress.."),
      ),
    );
  }
}

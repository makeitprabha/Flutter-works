import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskapp/bindings/getx_bindings.dart';
import 'package:taskapp/presentation_layer/dummy_screen.dart';
import 'package:taskapp/presentation_layer/home_screen.dart';

import 'widgets/bottom_navigation.dart';
import 'controllers/bottom_navigation_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: GetBindings(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final _childView = [
    const DummyPages(),
    OrdersScreen(),
    const DummyPages(),
    const DummyPages(),
    const DummyPages(),
  ];

  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
          backgroundColor: Colors.white,
          body: _childView[BottomNavigationController.to.index.value],
          bottomNavigationBar: const BottomNavigationView(),
        );
      }),
    );
  }
}

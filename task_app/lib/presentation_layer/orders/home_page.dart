import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskapp/controllers/bottom_navigation_controller.dart';
import 'package:taskapp/presentation_layer/dummy_screen.dart';
import 'package:taskapp/presentation_layer/orders/orders_screen.dart';
import 'package:taskapp/widgets/bottom_navigation.dart';

class MyHomePage extends StatelessWidget {
  final _controllder = Get.put(BottomNavigationController());
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
    return Obx(() {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: _childView[_controllder.index.value],
          bottomNavigationBar: BottomNavigationView(),
        ),
      );
    });
  }
}

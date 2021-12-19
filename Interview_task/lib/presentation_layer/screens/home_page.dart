import 'package:boa_task_app/controllers/bottom_navigation_bar_controller.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'counter_one_page.dart';
import 'counter_third_page.dart';
import 'counter_two_page.dart';

class MyHomePage extends GetView<BottomNavigationBarController> {
  MyHomePage({Key? key}) : super(key: key);

  // Counter page list
  final List<Widget> _widgetOptions = <Widget>[
    const CounterOnePage(),
    const CounterTwoPage(),
    const CounterThreePage(),
  ];

  @override
  Widget build(BuildContext context) {
    // Observing the values when event changed
    return Obx(() {
      return Scaffold(
        body: _widgetOptions.elementAt(
          controller.index.value,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // Incremeting the page counter value from the existing counter value
            await FirebaseDatabase.instance
                .ref('counter${controller.index.value + 1}')
                .set(ServerValue.increment(1));
          },
          child: const Icon(
            Icons.add,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
              label: 'Counter 1',
              icon: Icon(
                Icons.add,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Counter 2',
              icon: Icon(
                Icons.add,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Counter 3',
              icon: Icon(
                Icons.add,
              ),
            ),
          ],
          currentIndex: controller.index.value,
          onTap: (index) => controller.changeIndex(index),
        ),
      );
    });
  }
}

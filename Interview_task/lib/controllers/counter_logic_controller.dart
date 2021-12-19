import 'dart:async';

import 'package:boa_task_app/controllers/bottom_navigation_bar_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class CounterLogicController extends GetxController {
  static CounterLogicController get to => Get.find();
  final counter = 0.obs;
  late DatabaseReference _counterRef;
  late StreamSubscription<DatabaseEvent> _counterSubscription;

  @override
  void onReady() {
    super.onReady();
    init(); 
  }

  Future<void> init() async {
    _counterRef = FirebaseDatabase.instance
        .ref('counter${BottomNavigationBarController.to.index.value + 1}');
    _counterRef.keepSynced(true);
    _counterSubscription = _counterRef.onValue.listen(
      (DatabaseEvent event) {
        counter.value = (event.snapshot.value ?? 0) as int; 
      },
      onError: (Object o) {},
    );
  }

  @override
  void dispose() {
    super.dispose();
    _counterSubscription.cancel();
  }

  Future<void> incrementAsTransaction() async {
    try {
      await _counterRef.runTransaction((mutableData) {
        return Transaction.success((mutableData as int? ?? 0) + 1);
      });
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print(e.message);
      }
    }
  }
}

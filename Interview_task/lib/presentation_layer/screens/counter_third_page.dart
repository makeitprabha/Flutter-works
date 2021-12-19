import 'package:boa_task_app/controllers/counter_logic_controller.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterThreePage extends StatelessWidget {
  const CounterThreePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Observing the values when event changed
    return GetX(
        global: false,
        init: CounterLogicController(),
        builder: (CounterLogicController controller) { 
          return Scaffold(
            appBar: AppBar(
              title: Text('Counter ${controller.counter.value}'),
              actions: [
                IconButton(
                  onPressed: () {
                    FirebaseDatabase.instance.ref().remove();
                  },
                  icon: const Icon(
                    Icons.restore,
                  ),
                ),
              ],
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: controller.incrementAsTransaction,
                    child: const Text('Increment me!'),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    '${controller.counter.value}',
                    style: const TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

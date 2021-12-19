import 'package:get/get.dart';

class BottomNavigationBarController extends GetxController {
  static BottomNavigationBarController get to => Get.find();

  final index = 0.obs;

  void changeIndex(int position) {
    index.value = position;
  }
}

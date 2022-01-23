import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  static BottomNavigationController get to => Get.find();

  final index = 1.obs;

  void setBottomNavigationIndex(int _index) {
    index.value = _index;
  }
}

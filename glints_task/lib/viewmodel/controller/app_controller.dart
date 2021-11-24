import 'package:get/get.dart';

class AppController extends GetxController {
  static AppController get to => Get.find();

  final showProgress = false.obs;

  void setShowProgress(bool visible) async {
    showProgress.value = visible;
  }
}

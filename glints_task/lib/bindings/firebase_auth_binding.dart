import 'package:get/get.dart';
import 'package:task/viewmodel/controller/firebase_auth_controller.dart';

class FirebaseAuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<FirebaseAuthController>(FirebaseAuthController(), permanent: true);
  }
}

import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:taskapp/controllers/bottom_navigation_controller.dart'; 

class GetBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavigationController());
  }
}

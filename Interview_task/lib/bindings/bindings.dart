import 'package:boa_task_app/controllers/bottom_navigation_bar_controller.dart'; 
import 'package:get/get.dart';

class GetBindings extends Bindings {
  @override
  void dependencies() {
  Get.put<BottomNavigationBarController>(BottomNavigationBarController());  
  }
}

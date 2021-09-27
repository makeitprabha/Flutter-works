import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:taskapp/core/api_base.dart';
import 'package:taskapp/core/models/login/login_request.dart';
import 'package:taskapp/core/models/login/login_response.dart';
import 'package:taskapp/core/viewmodels/login/login_repository.dart';
import 'package:taskapp/presentation_layer/orders/home_page.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();

  final isLoading = false.obs;

  void setProgressLoading(bool loading) {
    isLoading.value = loading;
  }

  void getLoginResponse(LoginRequest _request) async {
    setProgressLoading(true);
    String _url = APIBase.baseURL + APIBase.getValue(APIPath.loginService);
    LoginResponse? response = await LoginRepository().getLoginResponse(
      _url,
      _request.toJson(),
    );
    setProgressLoading(false);
    if (response != null) {
      if (response.token != null) {
        await const FlutterSecureStorage().write(
          key: 'token',
          value: response.token,
        );
        await const FlutterSecureStorage().write(
          key: 'orderId',
          value: response.userId,
        );
        Get.to(
          MyHomePage(),
          transition: Transition.rightToLeft,
        );
      } else {
        Get.snackbar(
          'Error',
          'Invalid Credentials',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }
}

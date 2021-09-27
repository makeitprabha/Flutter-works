import 'package:dio/dio.dart';
import 'package:taskapp/core/models/login/login_response.dart';
import 'package:taskapp/core/services/network_exception.dart';
import 'package:taskapp/core/viewmodels/login/login_contractor.dart';

class LoginRepository implements ILoginContractor {
  @override
  Future<LoginResponse?> getLoginResponse(
      String url, Map<String, dynamic> _request) async {
    try {
      final Response response = await Dio().post(
        url,
        data: _request,
      );
      if (response.statusCode == 200) {
        return LoginResponse.fromJson(response.data);
      }
    } on DioError catch (e) {
      return LoginResponse.withError(NetworkException().handleError(e));
    }
    return null;
  }
}

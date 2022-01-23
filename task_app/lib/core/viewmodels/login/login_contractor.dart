import 'package:taskapp/core/models/login/login_response.dart';

abstract class ILoginContractor {
  Future<LoginResponse?> getLoginResponse(
    String url,
    Map<String, dynamic> _data,
  );
}

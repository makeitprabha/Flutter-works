import 'package:taskapp/core/services/dio_error.dart';

class LoginResponse {
  String? token;
  String? userId;
  DioCustomizeError? networkError;

  LoginResponse.withError(DioCustomizeError error) {
    networkError = error;
  }
  LoginResponse({
    this.token,
    this.userId,
  });
  LoginResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userId = json['userId'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['userId'] = userId;
    return data;
  }
}

import 'package:dio_api/core/models/user_response.dart';
import 'package:dio_api/core/sevices/user_api_provider.dart';

class UserRepository {
  UserApiProvider _apiProvider = UserApiProvider();

  Future<UserResponse> getUser() {
    return _apiProvider.getUser();
  }
}

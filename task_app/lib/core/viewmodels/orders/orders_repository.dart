import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:taskapp/core/models/orders/orders_response.dart';
import 'package:taskapp/core/services/network_exception.dart';
import 'package:taskapp/core/viewmodels/orders/orders_contractor.dart';

class OrdersRepository implements IOrdersContractor {
  @override
  Future<OrdersResponse?> getOrdersResponse(
      String url, Map<String, dynamic> _request) async {
    String? _authToken = '';
    await const FlutterSecureStorage().read(key: 'token').then((value) {
      _authToken = value;
    });
    Dio dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers['authorization'] = 'Bearer $_authToken';
    try {
      final Response response = await dio.post(
        url,
        data: _request,
      );
      if (response.statusCode == 200) {
        return OrdersResponse.fromJson(response.data);
      }
    } on DioError catch (e) {
      return OrdersResponse.withError(NetworkException().handleError(e));
    }
    return null;
  }
}

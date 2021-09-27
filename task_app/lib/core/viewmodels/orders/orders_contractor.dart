import 'package:taskapp/core/models/orders/orders_response.dart';

abstract class IOrdersContractor {
  Future<OrdersResponse?> getOrdersResponse(
    String url,
    Map<String, dynamic> _data,
  );
}

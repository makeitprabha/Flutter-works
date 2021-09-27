import 'package:taskapp/core/services/dio_error.dart';

class OrdersResponse {
  OrdersResponse({
    this.orders,
  });
  List<Orders>? orders;
  DioCustomizeError? networkError;

  OrdersResponse.withError(DioCustomizeError error) {
    networkError = error;
  }
  OrdersResponse.fromJson(Map<String, dynamic> json) {
    orders = List.from(json['orders']).map((e) => Orders.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['orders'] = orders!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Orders {
  Orders({
    this.orderNo,
    this.itemName,
    this.dateAdded,
    this.shippingStatus,
    this.paymentStatus,
    this.price,
  });
  int? orderNo;
  String? itemName;
  String? dateAdded;
  String? shippingStatus;
  String? paymentStatus;
  String? price;

  Orders.fromJson(Map<String, dynamic> json) {
    orderNo = json['orderNo'];
    itemName = json['item_name'];
    dateAdded = json['date_added'];
    shippingStatus = json['shipping_status'];
    paymentStatus = json['payment_status'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['orderNo'] = orderNo;
    _data['item_name'] = itemName;
    _data['date_added'] = dateAdded;
    _data['shipping_status'] = shippingStatus;
    _data['payment_status'] = paymentStatus;
    _data['price'] = price;
    return _data;
  }
}

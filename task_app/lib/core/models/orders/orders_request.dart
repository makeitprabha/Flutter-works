class OrdersRequest {
  late String orderId;

  OrdersRequest({
    orderId,
  });

  OrdersRequest.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['orderId'] = orderId;
    return data;
  }
}

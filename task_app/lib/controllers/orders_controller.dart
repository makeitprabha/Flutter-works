import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:taskapp/core/api_base.dart';
import 'package:taskapp/core/models/orders/orders_request.dart';
import 'package:taskapp/core/models/orders/orders_response.dart';
import 'package:taskapp/core/viewmodels/orders/orders_repository.dart';

class OrdersController extends GetxController {
  static OrdersController get to => Get.find();

  final ordersList = OrdersResponse().obs;
  final isLoading = false.obs;

  void setProgressLoading(bool loading) {
    isLoading.value = loading;
  }

  void setOrdersList(OrdersResponse response) {
    ordersList.value = response;
  }

  @override
  void onInit() {
    super.onInit();
    getOrdersResponse();
  }

  void getOrdersResponse() async {
    setProgressLoading(true);
    String _url = APIBase.baseURL + APIBase.getValue(APIPath.orderService);

    String? _orderId = '';
    await const FlutterSecureStorage().read(key: 'orderId').then((value) {
      _orderId = value;
    });
    OrdersRequest _request = OrdersRequest();
    _request.orderId = _orderId!;

    OrdersResponse? response = await OrdersRepository().getOrdersResponse(
      _url,
      _request.toJson(),
    );
    setProgressLoading(false);
    if (response != null) {
      setOrdersList(response);
    }
  }
}

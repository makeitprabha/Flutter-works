import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskapp/constants/colors.dart';
import 'package:taskapp/controllers/orders_controller.dart';
import 'package:taskapp/presentation_layer/orders/details_page.dart';

class OrdersScreen extends StatelessWidget {
  OrdersScreen({Key? key}) : super(key: key);
  final _controller = Get.put(OrdersController());

  final _colors = [
    colorYellow,
    colorShipping,
    colorBlue,
    colorBlue,
    colorBlue,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          height: 180.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 30.0,
            ),
            child: Column(
              children: <Widget>[
                headerSection(),
                const SizedBox(
                  height: 30.0,
                ),
                searchBarSection(),
              ],
            ),
          ),
        ),
        GetX(
          global: false,
          init: _controller,
          builder: (_) {
            if (_controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else if (_controller.ordersList.value.orders!.isNotEmpty) {
              return _listViewItems();
            } else {
              return const Center(child: Text("Can't load orders list here!!"));
            }
          },
        ),
      ],
    );
  }

  Widget _ordersTotalView() {
    return Padding(
      padding: const EdgeInsets.all(
        15.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'All Orders - ${_controller.ordersList.value.orders!.length}',
            style: const TextStyle(
              fontSize: 16.0,
              color: colorBlue,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buttonStyle(
                'All Times - ${_controller.ordersList.value.orders!.length}',
                Colors.white,
                colorBlue,
              ),
              _buttonStyle(
                'Today - ${_controller.ordersList.value.orders!.length}',
                colorBlue,
                colorSearchBg,
              ),
              const IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.calendar_today_rounded,
                  color: colorBlue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _listViewItems() {
    return Expanded(
      child: Container(
        color: colorDetailsBg,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 0.0,
            vertical: 10.0,
          ),
          child: Column(
            children: [
              _ordersTotalView(),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: _controller.ordersList.value.orders!.length,
                  itemBuilder: (context, index) {
                    return _itemBuilder(index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemBuilder(int index) {
    return InkWell(
      onTap: () {
        Get.to(
          DetailsView(
            orderNumber:
                'Order No - ${_controller.ordersList.value.orders![index].orderNo.toString()}',
          ),
          transition: Transition.rightToLeft,
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 6.0,
        ),
        child: Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                ListTile(
                  leading: SizedBox(
                    width: 60.0,
                    height: 60.0,
                    child: Image.asset('assets/images/test_image.png'),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      dynamicRowCreation(
                        'Order No - ${_controller.ordersList.value.orders![index].orderNo.toString()}',
                        _controller.ordersList.value.orders![index].price
                            .toString(),
                        colorBlue,
                        colorBlue,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      dynamicRowCreation(
                        _controller.ordersList.value.orders![index].dateAdded
                            .toString(),
                        _controller
                            .ordersList.value.orders![index].paymentStatus
                            .toString(),
                        Colors.green,
                        Colors.grey,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      dynamicBottomRowCreation(
                        _controller
                            .ordersList.value.orders![index].shippingStatus
                            .toString(),
                        _colors[index],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dynamicBottomRowCreation(String text, Color colorCode) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          String.fromCharCode(0x2022) + '\t' + text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: colorCode,
          ),
        ),
        _buttonStyle(
          'Details',
          colorBlue,
          colorSearchBg,
        ),
      ],
    );
  }

  Widget _buttonStyle(String text, Color textColor, Color boxBg) {
    return Container(
      decoration: BoxDecoration(
        color: boxBg,
        border: Border.all(
          width: 0.5,
          color: Colors.grey,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 15.0,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }

  Widget dynamicRowCreation(
      String orderNo, String amount, Color amountColor, Color orderColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          orderNo,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: orderColor,
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: amountColor,
          ),
        ),
      ],
    );
  }

  Widget searchBarSection() {
    return Container(
      decoration: BoxDecoration(
        color: colorSearchBg,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 200,
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                  hintStyle: TextStyle(
                    color: colorSearchText,
                  ),
                  hintText: 'Order id or Name',
                  border: InputBorder.none),
            ),
          ),
          borderIconsSet(
            Icons.search,
            Colors.white,
            colorBlue,
          ),
        ],
      ),
    );
  }

  Widget headerSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        borderIconsSet(
          Icons.dashboard,
          colorBlue,
          Colors.white,
        ),
        headerTextSection(),
        borderIconsSet(
          Icons.add,
          Colors.white,
          colorYellow,
        ),
      ],
    );
  }

  Widget headerTextSection() {
    return Row(
      children: const [
        Icon(
          Icons.shopping_basket_sharp,
          color: colorBlue,
          size: 30.0,
        ),
        SizedBox(
          width: 10.0,
        ),
        Text(
          'Bingo Shop',
          style: TextStyle(
            color: colorTextBlue,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget borderIconsSet(
      IconData iconData, Color iconColorCode, Color iconBackGround) {
    return Container(
      decoration: BoxDecoration(
        color: iconBackGround,
        border: Border.all(
          width: 0.5,
          color: Colors.grey,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Icon(
          iconData,
          color: iconColorCode,
        ),
      ),
    );
  }
}

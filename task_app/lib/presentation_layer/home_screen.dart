import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskapp/constants/colors.dart';
import 'package:taskapp/presentation_layer/details_page.dart';

class OrdersScreen extends StatelessWidget {
  OrdersScreen({Key? key}) : super(key: key);

  final _ordersNumber = [
    'Order No - 125463',
    'Order No - 125475',
    'Order No - 125789',
    'Order No - 125666',
    'Order No - 125123',
  ];
  final _amount = [
    'Rs. 67',
    'Rs. 99',
    'Rs. 153',
    'Rs. 23',
    'Rs. 89',
  ];
  final _date = [
    '08/09/2021 05:30 PM',
    '12/08/2021 02:30 PM',
    '10/09/2021 09:30 PM',
    '08/06/2021 06:30 AM',
    '15/09/2021 05:30 AM',
  ];
  final _colors = [
    colorYellow,
    colorShipping,
    colorBlue,
    colorBlue,
    colorBlue,
  ];
  final _status = [
    'Pending',
    'Shipped',
    'Accepted',
    'Accepted',
    'Accepted',
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
        _listViewItems(),
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
          const Text(
            'All Orders - 1543',
            style: TextStyle(
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
                'All Times - 1543',
                Colors.white,
                colorBlue,
              ),
              _buttonStyle(
                'Today - 8',
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
                  itemCount: 5,
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
            orderNumber: _ordersNumber[index],
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
                        _ordersNumber[index],
                        _amount[index],
                        colorBlue,
                        colorBlue,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      dynamicRowCreation(
                        _date[index],
                        'PAID',
                        Colors.green,
                        Colors.grey,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      dynamicBottomRowCreation(
                        _status[index],
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

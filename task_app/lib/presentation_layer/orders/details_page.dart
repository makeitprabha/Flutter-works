import 'package:flutter/material.dart';
import 'package:taskapp/constants/colors.dart';
import 'package:taskapp/widgets/custom_button.dart';

class DetailsView extends StatelessWidget {
  final String orderNumber;

  DetailsView({
    Key? key,
    required this.orderNumber,
  }) : super(key: key);

  final _leftRowValues = [
    'Selected Items',
    'Shipping Fee',
    'Subtotal',
  ];
  final _rightRowValues = [
    'Rs. 322',
    'Rs. 85',
    'Rs. 380',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: colorBlue,
          title: Text(
            orderNumber.toUpperCase(),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: _rowAllocation(),
            ),
            buttonView(),
          ],
        ),
      ),
    );
  }

  Widget _rowAllocation() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: _orderDetails(),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Expanded(
            child: _customerDetails(),
          ),
        ],
      ),
    );
  }

  Widget _orderDetails() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            horizontalTitleGap: 0.0,
            trailing: null,
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.check_box_outlined,
                ),
              ],
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 60.0,
                  height: 60.0,
                  child: Image.asset('assets/images/test_image.png'),
                ),
                const SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      _text(
                        "Fortuna Razana",
                        colorBlue,
                      ),
                      _text(
                        "Basmati Rice",
                        colorBlue,
                      ),
                      _text(
                        "1 Unit",
                        Colors.grey,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      _textViewCreation(
                        "2x Rs. 67",
                        "Rs 134",
                        colorBlue,
                        MainAxisAlignment.spaceBetween,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _customerDetails() {
    return Container(
      color: colorDetailsBg,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: _leftRowValues.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _textViewCreation(
                      _leftRowValues[index],
                      _rightRowValues[index],
                      colorBlue,
                      MainAxisAlignment.spaceBetween,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                  ],
                );
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Divider(
              height: 2.0,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 10.0,
            ),
            _text(
              'Customer Details',
              colorBlue,
            ),
            const SizedBox(
              height: 10.0,
            ),
            _textViewCreation(
              "Name: ",
              "Monica",
              colorBlue,
              MainAxisAlignment.start,
            ),
            const SizedBox(
              height: 10.0,
            ),
            _textViewCreation(
              "Mobile No: ",
              "+91 - 8745963215",
              colorBlue,
              MainAxisAlignment.start,
            ),
            const SizedBox(
              height: 10.0,
            ),
            _textViewCreation(
              "Address: ",
              "South Delhi",
              colorBlue,
              MainAxisAlignment.start,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _text(
                  "Paymnet: ",
                  colorBlue,
                ),
                const Spacer(),
                _text(
                  "Online Paymnet",
                  colorBlue,
                ),
                const Spacer(),
                _buttonStyle(
                  "Received",
                  colorPaid,
                  colorSearchBg,
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Divider(
              height: 2.0,
              color: Colors.grey,
            ),
          ],
        ),
      ),
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

  Widget _text(String text, Color textColor) {
    return Text(
      text,
      style: TextStyle(
        color: textColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _textViewCreation(String text1, String text2, Color textColor,
      MainAxisAlignment alignment) {
    return Row(
      mainAxisAlignment: alignment,
      children: [
        Text(
          text1,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 15.0,
        ),
        Text(
          text2,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget buttonView() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ReusableButtonWidget(
                btnBackground: colorReject,
                btnText: "Reject Order",
                btnTextColor: Colors.white,
                onButtonPressed: () {},
              ),
            ),
            const SizedBox(
              width: 5.0,
            ),
            Expanded(
              child: ReusableButtonWidget(
                btnBackground: colorBlue,
                btnText: "Accept Order",
                btnTextColor: Colors.white,
                onButtonPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

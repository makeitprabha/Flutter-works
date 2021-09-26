import 'package:flutter/material.dart';

class ReusableButtonWidget extends StatelessWidget {
  final Color btnBackground;
  final Color btnTextColor;
  final String btnText;
  final Function onButtonPressed;

  const ReusableButtonWidget({
    Key? key,
    required this.btnBackground,
    required this.btnText,
    required this.btnTextColor,
    required this.onButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.0,
      height: 44.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: btnBackground,
        ),
        child: Text(
          btnText,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: btnTextColor,
          ),
        ),
        onPressed: () {
          onButtonPressed();
        },
      ),
    );
  }
}

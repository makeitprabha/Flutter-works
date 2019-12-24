import 'package:flutter/material.dart';
import 'package:my_todo/ui/widgets/text.dart';

class ErrorViewWidget extends StatelessWidget {
  final String snapshot;

  ErrorViewWidget({
    @required this.snapshot,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: TextWidget(
        text: snapshot,
        textColor: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}

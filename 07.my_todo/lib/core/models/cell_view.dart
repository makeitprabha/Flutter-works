import 'package:flutter/material.dart';

class CellView {
  static List<String> myTodoTypes = [
    "Personal",
    "Meeting",
    "Shopping",
    "Others"
  ];

  static List<Color> myTodoTileColor = [
    Colors.blue[600],
    Colors.purple,
    Colors.red[700],
    Colors.cyan[800],
  ];

  static List<Image> myTodoIcons = [
    Image.asset('assets/images/personal.png'),
    Image.asset('assets/images/meeting.png'),
    Image.asset('assets/images/market.png'),
    Image.asset('assets/images/others.png'),
  ];

  static List<Image> myTodoIconsBlack = [
    Image.asset('assets/images/personal_black.png'),
    Image.asset('assets/images/meeting_black.png'),
    Image.asset('assets/images/market_black.png'),
    Image.asset('assets/images/others_black.png'),
  ];
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PageStateInformation with ChangeNotifier {
  int _currentPage = 0;
  String _title = "ToDo";
  bool isListClicked = false;
  bool isSetiingsActivate = false;

  bool get getIsSettingsActivate => isSetiingsActivate;

  set setIsSettingsActivate(bool clicked) {
    isSetiingsActivate = clicked;
    notifyListeners();
  }

  bool get getIsListClicked => isListClicked;

  set setIsListClicked(bool clicked) {
    isListClicked = clicked;
    notifyListeners();
  }

  set setCurrentPage(int currentIndex) {
    _currentPage = currentIndex;
    notifyListeners();
  }

  int get getCurrentPage => _currentPage;

  get getPageTitle => _title;

  set setPageTitle(String title) {
    _title = title;
    notifyListeners();
  }
}

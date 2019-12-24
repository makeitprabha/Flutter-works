import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final darkTheme = ThemeData.dark();

final lightTheme = ThemeData.light();

class ThemeChanger extends ChangeNotifier {
  final String themeKey = "theme";
  SharedPreferences _sharedPreferences;
  bool _darkTheme;

  bool get darkTheme => _darkTheme;

  ThemeChanger() {
    _darkTheme = true;
    _loadSharedPref();
  }

  toggleTheme() {
    _darkTheme = !_darkTheme;
    _savePref();
    notifyListeners();
  }

  _initPref() async {
    if (_sharedPreferences == null) {
      _sharedPreferences = await SharedPreferences.getInstance();
    }
  }

  _loadSharedPref() async {
    await _initPref();
    _darkTheme = _sharedPreferences.getBool(themeKey) ?? true;
    notifyListeners();
  }

  _savePref() async {
    await _sharedPreferences.setBool(themeKey, _darkTheme);
  }
}

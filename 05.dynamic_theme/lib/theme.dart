 
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; 

final darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF212121),
  accentColor: Colors.white,
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
);

final lightTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  backgroundColor: const Color(0xFFE5E5E5),
  accentColor: Colors.black,
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
);

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

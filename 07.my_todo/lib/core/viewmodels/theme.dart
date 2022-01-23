import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final darkTheme = ThemeData(
  appBarTheme: AppBarTheme(
    color: Colors.grey[850],
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    textTheme: TextTheme(
      title: TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
    ),
  ),
  brightness: Brightness.dark,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    elevation: 3.0,
    backgroundColor: Colors.grey,
  ),
  textTheme: TextTheme(
    body1: TextStyle(color: Colors.white),
    body2: TextStyle(color: Colors.white),
    button: TextStyle(color: Colors.white),
  ),
);

final lightTheme = ThemeData(
  appBarTheme: AppBarTheme(
    color: Colors.blue[900],
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    textTheme: TextTheme(
      title: TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
    ),
  ),
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

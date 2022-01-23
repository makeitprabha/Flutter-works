import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  final String _selectedThemeValue = "SelectedTheme";

  Future<bool> setSelectedTheme(bool theme) async {
    final SharedPreferences _instance = await SharedPreferences.getInstance();
    return _instance.setBool(_selectedThemeValue, theme);
  }

  Future<bool> getSelectedTheme() async {
    final SharedPreferences _instance = await SharedPreferences.getInstance();
    bool _theme = _instance.getBool(_selectedThemeValue);
    if (_theme == null) {
      return false;
    }
    return true;
  }

  Future<bool> remove() async {
    final SharedPreferences _instance = await SharedPreferences.getInstance();
    return _instance.remove(_selectedThemeValue);
  }
}

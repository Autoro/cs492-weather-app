import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  static const _darkModeDefault = false;
  static const _lightThemeColorDefault = 0xffffeb3b; // 4294961979;
  static const _darkThemeColorDefault = 0xff2196f3; // 4280391411;

  static const _darkModeKey = "darkMode";
  static const _lightThemeColorKey = "lightThememColor";
  static const _darkThemeColorKey = "darkThememColor";

  SharedPreferences? prefs;
  late bool _darkMode;
  late int _lightThemeColor;
  late int _darkThemeColor;

  bool get darkMode => _darkMode;
  Color get lightThemeColor => Color(_lightThemeColor);
  Color get darkThemeColor => Color(_darkThemeColor);

  Color get currentThemeColor {
    if (_darkMode) {
      return Color(_darkThemeColor);
    } else {
      return Color(_lightThemeColor);
    }
  }

  set lightThemeColor(Color color) {
    _lightThemeColor = color.value;
    prefs?.setInt(_lightThemeColorKey, _lightThemeColor);
    notifyListeners();
  }

  set darkThemeColor(Color color) {
    _darkThemeColor = color.value;
    prefs?.setInt(_darkThemeColorKey, _darkThemeColor);
    notifyListeners();
  }

  set currentThemeColor(Color color) {
    if (_darkMode) {
      darkThemeColor = color;
    } else {
      lightThemeColor = color;
    }
  }

  void toggleMode() {
    _darkMode = !_darkMode;
    if (prefs != null) {
      prefs!.setBool(_darkModeKey, _darkMode);
    }

    notifyListeners();
  }

  SettingsProvider() {
    initPreferences();
  }

  void initPreferences() async {
    prefs = await SharedPreferences.getInstance();

    if (prefs != null) {
      _darkMode = prefs?.getBool(_darkModeKey) ?? _darkModeDefault;
      _lightThemeColor = prefs!.getInt(_lightThemeColorKey) ?? _lightThemeColorDefault;
      _darkThemeColor = prefs!.getInt(_darkThemeColorKey) ?? _darkThemeColorDefault;
    }

    notifyListeners();
  }
}

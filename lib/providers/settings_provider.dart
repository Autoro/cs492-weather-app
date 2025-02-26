import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  SharedPreferences? perfs;

  bool get darkMode {
    return perfs?.getBool("darkmode") ?? false;
  }

  set darkMode(value) {
    perfs?.setBool("darkmode", value);
    notifyListeners();
  }

  SettingsProvider() {
    _initialize();
  }

  void _initialize() async {
    perfs = await SharedPreferences.getInstance();
  }
}
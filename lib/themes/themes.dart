// unused Theme

import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        brightness: Brightness.light,
        useMaterial3: true,
      );

ThemeData darkTheme = ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark),
        useMaterial3: true,
      );
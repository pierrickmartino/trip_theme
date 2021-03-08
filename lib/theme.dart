import 'package:flutter/material.dart';

var lightThemeData = ThemeData(
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: Colors.blue,
    textTheme: const TextTheme(button: TextStyle(color: Colors.white70)),
    brightness: Brightness.light,
    accentColor: Colors.blue);

var darkThemeData = ThemeData(
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: Colors.blue,
    textTheme: const TextTheme(button: TextStyle(color: Colors.black54)),
    brightness: Brightness.dark,
    accentColor: Colors.blue);

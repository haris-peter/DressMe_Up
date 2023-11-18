

import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme =ThemeData(
    brightness: Brightness.light,
    primarySwatch: const MaterialColor(0xFFB15EFF, <int,Color>{
      50:Color(0x1AB15EFF),
      100:Color(0x33B15EFF),
      200:Color(0x4DB15EFF),
      300:Color(0x66B15EFF),
      400:Color(0x80B15EFF),
      500:Color(0xFFB15EFF),
      600:Color(0x99B15EFF),
      700:Color(0xB3B15EFF),
      800:Color(0xCCB15EFF),
      900:Color(0xE6B15EFF),

    })
  );
  static ThemeData darkTheme =ThemeData();

}
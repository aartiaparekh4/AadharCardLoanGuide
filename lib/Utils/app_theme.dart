import 'package:flutter/material.dart';

import 'app_text_style.dart';

class AppTheme {
  static ThemeData get appThemeData {
    return _themeData;
  }

  static final ThemeData _themeData = ThemeData(
    useMaterial3: true,
    primarySwatch: Colors.green,
    fontFamily: "Poppins",
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.green,
      titleTextStyle: AppTextStyle.styleWhite16W500,
      centerTitle: true,
    ),
  );
}

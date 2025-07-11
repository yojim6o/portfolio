import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const primaryColor = pietBlue;
  static const darkBackgroundColor = Color(0xff110D12);

  static const gray = MaterialColor(100, {
    100: Color(0xFFFBFBFB),
    150: Color(0xFFF9F9F9),
    200: Color(0xFFE2E2E2),
    300: Color(0xFFC9C9C9),
    400: Color(0xFFB0B0B0),
    500: Color(0xFF979797),
    600: Color(0xFF7E7E7E),
    700: Color(0xFF646464),
    800: Color(0xFF4B4B4B),
    850: Color(0xFF131313),
    900: Color(0xFF110d12),
  });

  static const Color pietBlue = Color(0xFF41C0E9);

  //0xFFd21c2b;
  static const Color pietRed = Color(0xFFDA4854);
  static const Color pietYellow = Color(0xFFE9BF41);
  static const Color pietBlack = Color(0xFF191605);
  static const Color pietWhite = Color(0xFFf9f9f9);
  static const Color pietGreen = Color(0xFF31B672);
  static const Color miroBeige = Color(0xFFF5F5DC);

  static final trioColors = [
    AppColors.pietYellow,
    AppColors.pietGreen,
    AppColors.pietRed,
  ];

  static const List<Color> customColorsList = [
    pietRed,
    pietBlue,
    pietYellow,
    pietGreen,
    pietWhite,
  ];
}
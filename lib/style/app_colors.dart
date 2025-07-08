import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const primaryColor = pietBlue;
  static const darkBackgroundColor = Color(0xff110D12);

  static const gray = MaterialColor(100, {
    100: Color(0xFFFBFBFB),
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

  static const Color pietBlue = Color(0xFF14b2e5);

  //0xFFd21c2b;
  static const Color pietRed = Color(0xFFE65F78);
  static const Color pietYellow = Color(0xFFe5b114);
  static const Color pietBlack = Color(0xFF191605);
  static const Color pietWhite = Color(0xFFf9f9f9);
  static const Color pietGreen = Color(0xFF00A651);
  static const Color miroBeige = Color(0xFFF5F5DC);

  static const List<Color> miroList = [
    pietRed,
    pietWhite,
    pietBlue,
    pietYellow,
    pietGreen,
  ];
}
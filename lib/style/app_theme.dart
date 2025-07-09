import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/style/app_colors.dart';
import 'package:portfolio/style/app_size.dart';

class AppTheme {
  final String fontFamily = GoogleFonts.inter().fontFamily!;

  AppTheme(/*{this.fontFamily}*/);

  ThemeData get dark {
    return _getThemeData(
      cardColor: AppColors.darkBackgroundColor,
      colorScheme: ColorScheme.dark(
        primary: AppColors.primaryColor,
        surface: AppColors.gray[850]!,
        outline: AppColors.gray[800]!,
        outlineVariant: AppColors.gray[700]!,
        onSurface: AppColors.gray[300]!,
        onSurfaceVariant: AppColors.gray[400]!,
        tertiary: AppColors.gray[900]!,
      ),
      scaffoldBackgroundColor: AppColors.darkBackgroundColor,
      elevatedButtonTextStyle: _darkElevatedButtonTextStyle,
      outlinedButtonTextStyle: _darkOutlinedButtonTextStyle,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.gray[900]!.withAlpha(0),
      ),
    );
  }

  ThemeData get light {
    return _getThemeData(
      cardColor: Color(0xfff5e9dc),
      colorScheme: ColorScheme.light(
        primary: AppColors.pietBlue,
        primaryContainer: Color(0xfff5e9dc),
        outline: AppColors.gray[300]!,
        outlineVariant: AppColors.gray[400]!,
        onSurface: AppColors.gray[850]!,
        onSurfaceVariant: AppColors.gray[600]!,
        tertiary: AppColors.gray[900]!,
      ),
      scaffoldBackgroundColor: Colors.white,
      elevatedButtonTextStyle: _lightElevatedButtonTextStyle,
      outlinedButtonTextStyle: _lightOutlinedButtonTextStyle,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.gray[100]!.withAlpha(0),
      ),
    );
  }

  ThemeData _getThemeData({
    required ColorScheme colorScheme,
    required WidgetStateProperty<TextStyle> elevatedButtonTextStyle,
    required WidgetStateProperty<TextStyle> outlinedButtonTextStyle,
    required Color scaffoldBackgroundColor,
    required AppBarTheme appBarTheme,
    required Color cardColor,
  }) {
    return ThemeData(
      colorScheme: colorScheme,
      useMaterial3: true,
      fontFamily: fontFamily,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      appBarTheme: appBarTheme,
      cardColor: cardColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          fixedSize: const WidgetStatePropertyAll(Size.fromHeight(40)),
          backgroundColor: _primaryButtonStates,
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: Insets.xl, vertical: 10),
          ),
          textStyle: elevatedButtonTextStyle,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          fixedSize: const WidgetStatePropertyAll(Size.fromHeight(40)),
          side: _outlinedButtonStates,
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(horizontal: Insets.xl, vertical: 10),
          ),
          textStyle: outlinedButtonTextStyle,
        ),
      ),
    );
  }

  final _primaryButtonStates = WidgetStateProperty.resolveWith((states) {
    if (states.contains(WidgetState.hovered) ||
        states.contains(WidgetState.pressed)) {
      return AppColors.primaryColor.withAlpha(200);
    }
    return AppColors.primaryColor;
  });

  final _outlinedButtonStates = WidgetStateProperty.resolveWith((states) {
    return BorderSide(color: AppColors.pietBlack.withAlpha(200));
  });

  WidgetStatePropertyAll<TextStyle> get _darkElevatedButtonTextStyle =>
      WidgetStatePropertyAll(
        TextStyle(
          color: AppColors.gray[100],
          fontFamily: fontFamily,
          fontWeight: FontWeight.w500,
        ),
      );

  WidgetStatePropertyAll<TextStyle> get _lightElevatedButtonTextStyle =>
      WidgetStatePropertyAll(
        TextStyle(
          color: AppColors.gray[100],
          fontFamily: fontFamily,
          fontWeight: FontWeight.w500,
        ),
      );

  WidgetStatePropertyAll<TextStyle> get _darkOutlinedButtonTextStyle =>
      WidgetStatePropertyAll(
        TextStyle(
          color: AppColors.gray[100],
          fontFamily: fontFamily,
          fontWeight: FontWeight.w500,
        ),
      );

  WidgetStatePropertyAll<TextStyle> get _lightOutlinedButtonTextStyle =>
      WidgetStatePropertyAll(
        TextStyle(
          color: AppColors.gray[100],
          fontFamily: fontFamily,
          fontWeight: FontWeight.w500,
        ),
      );
}
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPref {
  static const localeKey = 'app_locale';
  static const themeKey = 'app_theme';

  static Future<void> setAppLocale(String locale) async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString(localeKey, locale);
  }

  static Future<String> getAppLocale() async {
    final sharedPref = await SharedPreferences.getInstance();
    return sharedPref.getString(localeKey) ?? 'en';
  }

  static Future<void> setAppTheme(ThemeMode mode) async {
    final sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString(themeKey, mode.name);
  }

  static Future<ThemeMode> getAppTheme() async {
    final sharedPref = await SharedPreferences.getInstance();
    final result = await sharedPref.getString(themeKey);
    if (result != null) {
      if (result == ThemeMode.light.name) {
        return ThemeMode.light;
      }
      return ThemeMode.dark;
    }
    return ThemeMode.dark;
  }
}
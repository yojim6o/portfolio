import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/features/home/presentation/home_page.dart';
import 'package:portfolio/shared/app_theme_controller.dart';
import 'package:portfolio/shared/providers.dart';
import 'package:portfolio/style/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'l10n/app_localizations.dart';
import 'shared/app_locale_controller.dart';

Future<void> main() async {
  //debugPaintSizeEnabled = true;
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
      child: ProviderScope(child: const MainApp()),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final locale = ref.watch(appLocaleControllerProvider);
    final theme = ref.watch(appThemeControllerProvider);
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Locale(locale.value ?? 'en'),
      theme: AppTheme(/*fontFamily: fontFamily(locale.value)*/).light,
      darkTheme: AppTheme(/*fontFamily: fontFamily(locale.value)*/).dark,
      themeMode: theme.value,
      supportedLocales: const [Locale('en'), Locale('es')],
      home: const Scaffold(body: HomePage()),
    );
  }

  String fontFamily(String? locale) {
    return (locale ?? 'en') == 'en' ? 'Poppins' : 'Dosis';
  }
}
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @projects.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get projects;

  /// No description provided for @projectsDescription.
  ///
  /// In en, this message translates to:
  /// **'Some of my personal projects with their respective link to GitHub repository.'**
  String get projectsDescription;

  /// No description provided for @blog.
  ///
  /// In en, this message translates to:
  /// **'Blog'**
  String get blog;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About me'**
  String get about;

  /// No description provided for @g1.
  ///
  /// In en, this message translates to:
  /// **'Gabriel Enguidanos'**
  String get g1;

  /// No description provided for @g2.
  ///
  /// In en, this message translates to:
  /// **'\'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua\','**
  String get g2;

  /// No description provided for @g3.
  ///
  /// In en, this message translates to:
  /// **'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'**
  String get g3;

  /// No description provided for @poweredByFlutter.
  ///
  /// In en, this message translates to:
  /// **'Web 100% powered by Flutter'**
  String get poweredByFlutter;

  /// No description provided for @experiences.
  ///
  /// In en, this message translates to:
  /// **'Experiences'**
  String get experiences;

  /// No description provided for @experiencesDescription.
  ///
  /// In en, this message translates to:
  /// **'Here are my experiences as a software developer.'**
  String get experiencesDescription;

  /// No description provided for @skills.
  ///
  /// In en, this message translates to:
  /// **'Skills'**
  String get skills;

  /// No description provided for @skillsDescription.
  ///
  /// In en, this message translates to:
  /// **'Languages, frameworks and tools I\'ve used during my career'**
  String get skillsDescription;

  /// No description provided for @javaDescription.
  ///
  /// In en, this message translates to:
  /// **'Solid knowledge of Java language, familiar with generics, interfaces, inheritance and crucial dependencies like Lombok and Mapstruct.'**
  String get javaDescription;

  /// No description provided for @jsDescription.
  ///
  /// In en, this message translates to:
  /// **'Wide understanding of JS language, as async await, fetch, deconstruction, functions as parameters and DOM modification.'**
  String get jsDescription;

  /// No description provided for @mongoDescription.
  ///
  /// In en, this message translates to:
  /// **'I had to learn mongo by force and soon I get comfortable with its own vision. As well as basic querys, I\'ve managed to do complex querys using aggregations and also facets.'**
  String get mongoDescription;

  /// No description provided for @goDescription.
  ///
  /// In en, this message translates to:
  /// **'Basic knowledge. Expecting to learn more and more as it is positioned as reliable, fast, flexible and easy to understand language.'**
  String get goDescription;

  /// No description provided for @rustDescription.
  ///
  /// In en, this message translates to:
  /// **'Very basic knowledge of the language, but  would be really excited if I could grow up my Rust skills as it has proven to be a future proof language.'**
  String get rustDescription;

  /// No description provided for @reactDescription.
  ///
  /// In en, this message translates to:
  /// **'I\'ve worked a lot on React and really enjoyed it. Usage of custom hooks, composition and inner routing.'**
  String get reactDescription;

  /// No description provided for @springDescription.
  ///
  /// In en, this message translates to:
  /// **'I work fluently with Spring 3+, integrating Spring Security and Spring Data.'**
  String get springDescription;

  /// No description provided for @flutterDescription.
  ///
  /// In en, this message translates to:
  /// **'I\'m relatively new to Flutter but I am really enjoying my time with it. At the moment I\'ve coded a weather app for android and this portfolio is powered by Flutter also.'**
  String get flutterDescription;

  /// No description provided for @mongoCompassDescription.
  ///
  /// In en, this message translates to:
  /// **'Basic usage for building aggregations, creating indexes, modifying data or run scripts.'**
  String get mongoCompassDescription;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}

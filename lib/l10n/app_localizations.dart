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
  /// **'Gabriel Enguídanos'**
  String get g1;

  /// No description provided for @g2.
  ///
  /// In en, this message translates to:
  /// **'\'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\' - Linus Torvalds.'**
  String get g2;

  /// No description provided for @g3.
  ///
  /// In en, this message translates to:
  /// **'Hi there! Welcome to my portfolio and... yes, you guessed it! It\'s inspired by the art of Piet Mondrian. I studied the Higher Diploma in Web Application Development at IES La Vereda (Valencia) with good grades, working with technologies such as Java, React, Laravel, Android Mobile, Bootstrap and SQL. This allowed me to build a solid foundation on which to keep expanding my knowledge and technical curiosity. When programming, I always try to apply the DRY principle and aim for high levels of abstraction.'**
  String get g3;

  /// No description provided for @poweredByFlutter.
  ///
  /// In en, this message translates to:
  /// **'Web 100% powered by Flutter'**
  String get poweredByFlutter;

  /// No description provided for @scoreShareAppDescription.
  ///
  /// In en, this message translates to:
  /// **'Score Share is a web application that I presented for my bachelor\'s thesis. I worked with NextJS as a fullstack framework, Tailwind and ShadCn as style management and NeonTech and Supabase as backend storage. The app provides an interface for musicians to upload tabs, sheets and arrangements of a particular song. The song search is powered by Spotify API.'**
  String get scoreShareAppDescription;

  /// No description provided for @weatherAppDescription.
  ///
  /// In en, this message translates to:
  /// **'This was my first personal project in Flutter. At the beggining I wasn\'t Flutter skilled, but the problems I faced made me become more fluent.\nIt is a minimalist design, that retrieves location automatically from phone and then fetcehs the data and transfomrs it. I made use of Bloc, Cubit, Trent, Repository, Freezed, custom theme and RxDart for stream management.'**
  String get weatherAppDescription;

  /// No description provided for @portfolioAppDescription.
  ///
  /// In en, this message translates to:
  /// **'I build a my portfolio entirely on Flutter. No better way to learn Flutter, for sure! Use of theme switch, as well as reusable widgets and responsive design.'**
  String get portfolioAppDescription;

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

  /// No description provided for @sqlDescription.
  ///
  /// In en, this message translates to:
  /// **'Hight knowledge in SQL queries, even with more complex and inner queries.'**
  String get sqlDescription;

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
  /// **'I\'m relatively new to Flutter but I am really enjoying my time with it. At the moment I\'ve coded a weather app for Android and this portfolio is alse powered by Flutter.'**
  String get flutterDescription;

  /// No description provided for @mongoCompassDescription.
  ///
  /// In en, this message translates to:
  /// **'Basic usage for building aggregations, creating indexes, modifying data or run scripts.'**
  String get mongoCompassDescription;

  /// No description provided for @dawExperience.
  ///
  /// In en, this message translates to:
  /// **'Finalizado con éxito;Diploma académico a la excelencia académica;Amplio stack de tecnologías'**
  String get dawExperience;

  /// No description provided for @sopraExperience.
  ///
  /// In en, this message translates to:
  /// **'Prácticas que finalizan con contratación indefinida;Terminar proyectos clave con Spring 3.0 y JAVA 17;Felicitaciones por parte de la directiva por el trabajo realizado en proyectos clave'**
  String get sopraExperience;
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

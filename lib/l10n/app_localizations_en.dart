// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get home => 'Home';

  @override
  String get projects => 'Projects';

  @override
  String get projectsDescription => 'Some of my personal projects with their respective link to GitHub repository.';

  @override
  String get blog => 'Blog';

  @override
  String get about => 'About me';

  @override
  String get g1 => 'Gabriel Enguídanos';

  @override
  String get g2 => '\'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\' - Linus Torvalds.';

  @override
  String get g3 => 'Hi there! Welcome to my portfolio and... yes, you guessed it! It\'s inspired by the art of Joan Miró. I studied the Higher Diploma in Web Application Development at IES La Vereda (Valencia) with good grades, working with technologies such as Java, React, Laravel, Android Mobile, Bootstrap and SQL. This allowed me to build a solid foundation on which to keep expanding my knowledge and technical curiosity. When programming, I always try to apply the DRY principle and aim for high levels of abstraction.';

  @override
  String get poweredByFlutter => 'Web 100% powered by Flutter';

  @override
  String get scoreShareAppDescription => 'Score Share is a web application that I presented for my bachelor\'s thesis. I worked with NextJS as a fullstack framework, Tailwind and ShadCn as style management and NeonTech and Supabase as backend storage. The app provides an interface for musicians to upload tabs, sheets and arrangements of a particular song. The song search is powered by Spotify API.';

  @override
  String get weatherAppDescription => 'This was my first personal project in Flutter. At the beggining I wasn\'t Flutter skilled, but the problems I faced made me become more fluent.\nIt is a minimalist design, that retrieves location automatically from phone and then fetcehs the data and transfomrs it. I made use of Bloc, Cubit, Trent, Repository, Freezed, custom theme and RxDart for stream management.';

  @override
  String get portfolioAppDescription => 'I build a my portfolio entirely on Flutter. No better way to learn Flutter, for sure! Use of theme switch, as well as reusable widgets and responsive design.';

  @override
  String get experiences => 'Experiences';

  @override
  String get experiencesDescription => 'Here are my experiences as a software developer.';

  @override
  String get skills => 'Skills';

  @override
  String get skillsDescription => 'Languages, frameworks and tools I\'ve used during my career';

  @override
  String get javaDescription => 'Solid knowledge of Java language, familiar with generics, interfaces, inheritance and crucial dependencies like Lombok and Mapstruct.';

  @override
  String get jsDescription => 'Wide understanding of JS language, as async await, fetch, deconstruction, functions as parameters and DOM modification.';

  @override
  String get sqlDescription => 'Hight knowledge in SQL queries, even with more complex and inner queries.';

  @override
  String get mongoDescription => 'I had to learn mongo by force and soon I get comfortable with its own vision. As well as basic querys, I\'ve managed to do complex querys using aggregations and also facets.';

  @override
  String get goDescription => 'Basic knowledge. Expecting to learn more and more as it is positioned as reliable, fast, flexible and easy to understand language.';

  @override
  String get rustDescription => 'Very basic knowledge of the language, but  would be really excited if I could grow up my Rust skills as it has proven to be a future proof language.';

  @override
  String get reactDescription => 'I\'ve worked a lot on React and really enjoyed it. Usage of custom hooks, composition and inner routing.';

  @override
  String get springDescription => 'I work fluently with Spring 3+, integrating Spring Security and Spring Data.';

  @override
  String get flutterDescription => 'I\'m relatively new to Flutter but I am really enjoying my time with it. At the moment I\'ve coded a weather app for Android and this portfolio is alse powered by Flutter.';

  @override
  String get mongoCompassDescription => 'Basic usage for building aggregations, creating indexes, modifying data or run scripts.';

  @override
  String get dawExperience => 'Finalizado con éxito;Diploma académico a la excelencia académica;Amplio stack de tecnologías';

  @override
  String get sopraExperience => 'Prácticas que finalizan con contratación indefinida;Terminar proyectos clave con Spring 3.0 y JAVA 17;Felicitaciones por parte de la directiva por el trabajo realizado en proyectos clave';
}

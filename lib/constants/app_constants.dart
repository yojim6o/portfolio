import 'package:flutter/material.dart';
import 'package:portfolio/extensions.dart';

class AppIcon {
  static const String _icons = '/icons';

  static String en = '$_icons/en.svg';
  static String es = '$_icons/es.svg';
  static String linkedin = '$_icons/ic-linkedin.svg';
  static String github = '$_icons/ic-github.svg';
  static String java = '$_icons/ic-java.svg';
  static String js = '$_icons/ic-js.svg';
  static String javascript = '$_icons/ic-java.svg';
  static String go = '$_icons/ic-go.svg';
  static String rust = '$_icons/ic-rust.svg';
  static String mongo = '$_icons/ic-mongo.svg';
  static String sql = '$_icons/ic-sql.svg';
  static String react = '$_icons/ic-react.svg';
  static String spring = '$_icons/ic-spring.svg';
  static String flutter = '$_icons/ic-flutter.svg';
  static String vscode = '$_icons/ic-code.svg';
  static String idea = '$_icons/ic-idea.svg';
  static String mongoCompass = '$_icons/ic-mongo.svg';
  static String tailwind = '$_icons/ic-tailwind.svg';
  static String postman = '$_icons/ic-postman.svg';
}

class AppUrl {
  static Uri linkedinUri = Uri(
    scheme: "https",
    host: "www.linkedin.com",
    path: "/in/gabriel-engu%C3%ADdanos-web/",
  );

  static Uri githubUri = Uri(
    scheme: "https",
    host: "github.com",
    path: "yojim6o",
    query: "?tab=repositories",
  );
}

class _CustomColorMode {
  final Color light;
  final Color dark;

  _CustomColorMode({required this.light, required this.dark});
}

class AppSkills {
  static final highKnowledge = _CustomColorMode(
    light: Color(0xffDCF5DC),
    dark: Colors.black,
  );
  static final midKnowledge = _CustomColorMode(
    light: Color(0xffDCF5A1),
    dark: Color.fromARGB(255, 10, 12, 14),
  );
  static final lowKnowledge = _CustomColorMode(
    light: Color(0xffDCDCF5),
    dark: Color.fromARGB(255, 15, 17, 19),
  );
  static Map<String, Map<String, dynamic>> skillCategories = {
    "languages": {
      "java": {
        "icon": AppIcon.java,
        "color": (bool isDark) =>
            isDark ? highKnowledge.dark : highKnowledge.light,
        "description": (BuildContext c) => c.text.javaDescription,
      },
      "javascript": {
        "icon": AppIcon.js,
        "color": (bool isDark) =>
            isDark ? highKnowledge.dark : highKnowledge.light,
        "description": (BuildContext c) => c.text.jsDescription,
      },
      "sql": {
        "icon": AppIcon.sql,
        "color": (bool isDark) =>
            isDark ? midKnowledge.dark : midKnowledge.light,
        "description": (BuildContext c) => c.text.sqlDescription,
      },
      "mongo": {
        "icon": AppIcon.mongo,
        "color": (bool isDark) =>
            isDark ? midKnowledge.dark : midKnowledge.light,
        "description": (BuildContext c) => c.text.mongoDescription,
      },
      "go": {
        "icon": AppIcon.go,
        "color": (bool isDark) =>
            isDark ? midKnowledge.dark : midKnowledge.light,
        "description": (BuildContext c) => c.text.goDescription,
      },
      "rust": {
        "icon": AppIcon.rust,
        "color": (bool isDark) =>
            isDark ? lowKnowledge.dark : lowKnowledge.light,
        "description": (BuildContext c) => c.text.rustDescription,
      },
    },
    "frameworks": {
      "react": {
        "icon": AppIcon.react,
        "color": (bool isDark) =>
            isDark ? highKnowledge.dark : highKnowledge.light,
        "description": (BuildContext c) => c.text.reactDescription,
      },
      "spring": {
        "icon": AppIcon.spring,
        "color": (bool isDark) =>
            isDark ? midKnowledge.dark : midKnowledge.light,
        "description": (BuildContext c) => c.text.springDescription,
      },
      "flutter": {
        "icon": AppIcon.flutter,
        "color": (bool isDark) =>
            isDark ? midKnowledge.dark : midKnowledge.light,
        "description": (BuildContext c) => c.text.flutterDescription,
      },
    },
    "tools&others": {
      "vs code": {
        "icon": AppIcon.vscode,
        "color": (bool isDark) =>
            isDark ? highKnowledge.dark : highKnowledge.light,
        "description": (_) => '',
      },
      "intellij": {
        "icon": AppIcon.idea,
        "color": (bool isDark) =>
            isDark ? highKnowledge.dark : highKnowledge.light,
        "description": (_) => '',
      },
      "tailwind": {
        "icon": AppIcon.tailwind,
        "color": (bool isDark) =>
            isDark ? highKnowledge.dark : highKnowledge.light,
        "description": (_) => '',
      },
      "postman": {
        "icon": AppIcon.postman,
        "color": (bool isDark) =>
            isDark ? midKnowledge.dark : midKnowledge.light,
        "description": (_) => '',
      },
      "mongo compass": {
        "icon": AppIcon.mongoCompass,
        "color": (bool isDark) =>
            isDark ? lowKnowledge.dark : lowKnowledge.light,
        "description": (BuildContext c) => c.text.mongoCompassDescription,
      },
    },
  };
}

class Experience {
  final String title;
  final DateTime start;
  DateTime? end;
  final List<String> Function(BuildContext context) descriptionItems;

  Experience({
    required this.title,
    required this.start,
    this.end,
    required this.descriptionItems,
  });
}

class AppExperiences {
  static final experiences = [
    Experience(
      title: "DAW",
      start: DateTime(2022, DateTime.september),
      end: DateTime(2024, DateTime.june),
      descriptionItems: (context) => context.text.dawExperience.split(";"),
    ),
    Experience(
      title: "Sopra Steria",
      start: DateTime(2024, DateTime.july),
      descriptionItems: (context) => context.text.sopraExperience.split(";"),
    ),
  ];
}

class Project {
  final String title;
  final List<String> imagePaths;
  final String Function(BuildContext) description;
  final String url;

  Project({
    required this.title,
    required this.url,
    required this.imagePaths,
    required this.description,
  });
}

class AppProjects {
  AppProjects(_);

  static final projects = [
    Project(
      title: "Score Share",
      imagePaths: ['assets/images/score-share.jpg'],
      url: "https://github.com/Tarkus99/scoreshare/tree/main/scoreShare",
      description: (BuildContext context) =>
          context.text.scoreShareAppDescription,
    ),
    Project(
      title: "Weather App Android",
      imagePaths: [
        'assets/images/weather-light.jpg',
        'assets/images/weather-dark.jpg',
      ],
      url:
          "https://github.com/yojim6o/flutter-weather-app/tree/iteration_1.2.trent",
      description: (BuildContext context) => context.text.weatherAppDescription,
    ),
    Project(
      title: "Flutter Portfolio",
      imagePaths: ['assets/images/portfolio.jpg'],
      url: "https://github.com/yojim6o/portfolio",
      description: (BuildContext context) =>
          context.text.portfolioAppDescription,
    ),
  ];
}
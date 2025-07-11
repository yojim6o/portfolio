import 'package:flutter/material.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/features/experiences/model/experience.dart';
import 'package:portfolio/features/projects/model/project.dart';
import 'package:portfolio/features/skills/model/skill.dart';

class AppIcon {
  AppIcon._();

  static const String _icons = 'assets/icons';

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
  AppUrl._();

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
  AppSkills._();

  static final highKnowledge = _CustomColorMode(
    light: Color(0xffDCF5DC),
    dark: Colors.black,
  );
  static final midKnowledge = _CustomColorMode(
    light: Color(0xffDCF5A1),
    dark: Color.fromARGB(255, 10, 12, 21),
  );
  static final lowKnowledge = _CustomColorMode(
    light: Color(0xffDCDCF5),
    dark: Color.fromARGB(255, 15, 17, 21),
  );
  static Map<String, List<Skill>> skillCategories = {
    "languages": [
      Skill(
        skillName: 'Java',
        skillDescription: (c) => c.text.javaDescription,
        iconPath: AppIcon.java,
        color: (bool isDark) =>
            isDark ? highKnowledge.dark : highKnowledge.light,
      ),
      Skill(
        skillName: 'javascript',
        skillDescription: (c) => c.text.jsDescription,
        iconPath: AppIcon.js,
        color: (bool isDark) =>
            isDark ? highKnowledge.dark : highKnowledge.light,
      ),
      Skill(
        skillName: 'sql',
        skillDescription: (c) => c.text.sqlDescription,
        iconPath: AppIcon.sql,
        color: (bool isDark) => isDark ? midKnowledge.dark : midKnowledge.light,
      ),
      Skill(
        skillName: 'mongo',
        skillDescription: (c) => c.text.mongoDescription,
        iconPath: AppIcon.mongo,
        color: (bool isDark) => isDark ? midKnowledge.dark : midKnowledge.light,
      ),
      Skill(
        skillName: 'go',
        skillDescription: (c) => c.text.goDescription,
        iconPath: AppIcon.go,
        color: (bool isDark) => isDark ? lowKnowledge.dark : lowKnowledge.light,
      ),
      Skill(
        skillName: 'rust',
        skillDescription: (c) => c.text.rustDescription,
        iconPath: AppIcon.rust,
        color: (bool isDark) => isDark ? lowKnowledge.dark : lowKnowledge.light,
      ),
    ],
    "frameworks": [
      Skill(
        skillName: 'react',
        skillDescription: (c) => c.text.reactDescription,
        iconPath: AppIcon.react,
        color: (bool isDark) =>
            isDark ? highKnowledge.dark : highKnowledge.light,
      ),
      Skill(
        skillName: 'spring',
        skillDescription: (c) => c.text.springDescription,
        iconPath: AppIcon.spring,
        color: (bool isDark) => isDark ? midKnowledge.dark : midKnowledge.light,
      ),
      Skill(
        skillName: 'flutter',
        skillDescription: (c) => c.text.flutterDescription,
        iconPath: AppIcon.flutter,
        color: (bool isDark) => isDark ? midKnowledge.dark : midKnowledge.light,
      ),
    ],

    "tools&others": [
      Skill(
        skillName: 'vs code',
        skillDescription: (_) => '',
        iconPath: AppIcon.vscode,
        color: (bool isDark) =>
            isDark ? highKnowledge.dark : highKnowledge.light,
      ),
      Skill(
        skillName: 'intellij',
        skillDescription: (_) => '',
        iconPath: AppIcon.idea,
        color: (bool isDark) =>
            isDark ? highKnowledge.dark : highKnowledge.light,
      ),
      Skill(
        skillName: 'tailwind css',
        skillDescription: (_) => '',
        iconPath: AppIcon.tailwind,
        color: (bool isDark) =>
            isDark ? highKnowledge.dark : highKnowledge.light,
      ),
      Skill(
        skillName: 'postman',
        skillDescription: (_) => '',
        iconPath: AppIcon.postman,
        color: (bool isDark) => isDark ? midKnowledge.dark : midKnowledge.light,
      ),
      Skill(
        skillName: 'mongo compass',
        skillDescription: (c) => c.text.mongoCompassDescription,
        iconPath: AppIcon.mongoCompass,
        color: (bool isDark) => isDark ? lowKnowledge.dark : lowKnowledge.light,
      ),
    ],
  };
}

class AppExperiences {
  AppExperiences._();

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
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
  static String react = '$_icons/ic-react.svg';
  static String spring = '$_icons/ic-spring.svg';
  static String flutter = '$_icons/ic-flutter.svg';
  static String vscode = '$_icons/ic-code.svg';
  static String idea = '$_icons/ic-idea.svg';
  static String mongoCompass = '$_icons/ic-mongo.svg';
  static String tailwind = '$_icons/ic-tailwind.svg';
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
    dark: Color(0xFF4CAF50),
  );
  static final midKnowledge = _CustomColorMode(
    light: Color(0xffDCF5A1),
    dark: Color(0xFFFBC02D),
  );
  static final lowKnowledge = _CustomColorMode(
    light: Color(0xffDCDCF5),
    dark: Color(0xFF9575CD),
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
        "description": (BuildContext c) => '',
      },
      "intellij": {
        "icon": AppIcon.idea,
        "color": (bool isDark) =>
            isDark ? highKnowledge.dark : highKnowledge.light,
        "description": (BuildContext c) => '',
      },
      "mongo compass": {
        "icon": AppIcon.mongoCompass,
        "color": (bool isDark) =>
            isDark ? lowKnowledge.dark : lowKnowledge.light,
        "description": (BuildContext c) => c.text.mongoCompassDescription,
      },
      "tailwind": {
        "icon": AppIcon.tailwind,
        "color": (bool isDark) =>
            isDark ? lowKnowledge.dark : lowKnowledge.light,
        "description": (BuildContext c) => '',
      },
    },
  };
}
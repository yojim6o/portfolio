import 'package:flutter/widgets.dart';

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
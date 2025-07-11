import 'package:flutter/widgets.dart';

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
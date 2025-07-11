import 'package:flutter/widgets.dart';

class Skill {
  final String skillName;
  final String Function(BuildContext) skillDescription;
  final String iconPath;
  final Color Function(bool) color;

  Skill({
    required this.skillName,
    required this.skillDescription,
    required this.iconPath,
    required this.color,
  });
}
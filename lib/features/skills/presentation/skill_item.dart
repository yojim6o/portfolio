import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';

class SkillItem extends StatelessWidget {
  const SkillItem({
    super.key,
    required this.iconPath,
    required this.title,
    required this.color,
    required this.description,
    this.isMobile = false,
  });

  final String iconPath;
  final String title;
  final String description;
  final Color color;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: isMobile ? BorderRadius.circular(999) : null,
      //shadowColor: color,
      elevation: 2.5,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border(left: BorderSide(color: color)),
        ),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 40,
                  height: 40,
                  child: SvgPicture.asset(
                    iconPath,
                    height: 24,
                    width: 24,
                    color: color,
                  ),
                ),
                if (!isMobile) Gap(16),
                if (!isMobile)
                  Expanded(
                    child: Text(title, style: context.textStyle.titleSmBold),
                  ),
              ],
            ),
            if (!isMobile) Gap(16),
            if (!isMobile)
              Text(
                description,
                style: context.textStyle.bodyMdMedium.copyWith(
                  color: context.theme.colorScheme.onSurface.withAlpha(200),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
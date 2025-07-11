import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/features/skills/model/skill.dart';

import '../../../style/app_colors.dart';

class SkillItem extends StatelessWidget {
  const SkillItem({
    super.key,
    required this.skill,
    this.isMobile = false,
    required this.color,
  });

  final Skill skill;
  final Color color;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return isMobile
        ? SkillItemMobileView(iconPath: skill.iconPath, color: color)
        : SkillDesktopView(
            title: skill.skillName,
            description: skill.skillDescription(context),
            iconPath: skill.iconPath,
            color: color,
          );
  }
}

class SkillDesktopView extends StatelessWidget {
  final String title;
  final String description;
  final String iconPath;
  final Color color;

  const SkillDesktopView({
    super.key,
    required this.title,
    required this.description,
    required this.iconPath,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
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
                    color: context.isDark
                        ? _adjustColorBrightness(color, 20)
                        : color,
                  ),
                ),
                const Gap(16),
                Expanded(
                  child: Text(
                    title.toUpperCase(),
                    style: context.textStyle.titleSmBold,
                  ),
                ),
              ],
            ),
            const Gap(16),
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

  Color _adjustColorBrightness(Color color, int amount) {
    return Color.fromARGB(
      color.alpha,
      (color.red + amount).clamp(0, 255),
      (color.green + amount).clamp(0, 255),
      (color.blue + amount).clamp(0, 255),
    );
  }
}

class SkillItemMobileView extends StatelessWidget {
  const SkillItemMobileView({
    super.key,
    required this.iconPath,
    required this.color,
  });

  final String iconPath;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.25,
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: color, width: 0.5),
            gradient: LinearGradient(
              stops: const [0.09, 0.109, 0.11, 1],
              colors: [color, color, AppColors.pietWhite, AppColors.pietWhite],
            ),
          ),
          child: FractionallySizedBox(
            widthFactor: 0.6,
            child: Center(
              child: SvgPicture.asset(iconPath, width: double.infinity),
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/widgets/styled_card.dart';

class SkillItem extends StatelessWidget {
  const SkillItem({
    super.key,
    required this.iconPath,
    required this.title,
    required this.color,
    required this.description,
  });

  final String iconPath;
  final String title;
  final String description;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return StyledCard(
      color: color,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: SvgPicture.asset(iconPath, height: 24, width: 24),
              ),
              Gap(16),
              Expanded(
                child: Text(
                  title,
                  style: context.textStyle.titleMdMedium.copyWith(
                    color: context.theme.colorScheme.onBackground,
                  ),
                ),
              ),
            ],
          ),
          Gap(16),
          Text(
            description,
            style: context.textStyle.bodyMdMedium.copyWith(
              color: context.theme.colorScheme.onBackground,
            ),
          ),
        ],
      ),
    );
  }
}
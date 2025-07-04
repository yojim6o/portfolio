import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/widgets/styled_card.dart';

class SkillItem extends StatelessWidget {
  const SkillItem({super.key});

  @override
  Widget build(BuildContext context) {
    return StyledCard(
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: CircleAvatar(
                  backgroundImage: Image.network('src').image,
                ),
              ),
              Gap(16),
              Expanded(
                child: Text(
                  'testimony name',
                  style: context.textStyle.bodyLgBold.copyWith(
                    color: context.theme.colorScheme.onBackground,
                  ),
                ),
              ),
            ],
          ),
          Gap(16),
          Text(
            'Text of testimony',
            style: context.textStyle.bodyMdMedium.copyWith(
              color: context.theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
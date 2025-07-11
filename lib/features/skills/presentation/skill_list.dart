import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/constants/app_constants.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/features/skills/presentation/skill_item.dart';
import 'package:portfolio/style/app_colors.dart';

import '../../../widgets/home_title_subtitle.dart';

class SkillList extends StatelessWidget {
  const SkillList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeTitleSubtitle(
          title: context.text.skills,
          subtitle: context.text.skillsDescription,
        ),
        Gap(32),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
          child: context.isDesktopOrTable
              ? _DesktopSkillsContainer()
              : _MobileSkillsContainer(),
        ),
      ],
    );
  }
}

class _DesktopSkillsContainer extends StatelessWidget {
  _DesktopSkillsContainer();

  final skills = AppSkills.skillCategories.entries.toList();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < skills.length; i++) ...[
          Expanded(
            child: Column(
              children: [
                _CustomTextSpan(
                  color: AppColors.trioColors.elementAt(i),
                  title: skills.elementAt(i).key,
                ),
                const Gap(16),
                Column(
                  spacing: 8,
                  children: skills.elementAt(i).value.map<Widget>((s) {
                    return SkillItem(
                      skill: s,
                      color: AppColors.trioColors.elementAt(i),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          const Gap(8),
        ],
      ],
    );
  }
}

class _MobileSkillsContainer extends StatelessWidget {
  _MobileSkillsContainer();

  final skills = AppSkills.skillCategories.entries.toList();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            for (int i = 0; i < skills.length; i++) ...[
              Column(
                children: [
                  _CustomTextSpan(
                    color: AppColors.trioColors.elementAt(i),
                    title: skills.elementAt(i).key,
                  ),
                  Gap(8),
                  Wrap(
                    direction: Axis.horizontal,
                    spacing: 8,
                    runSpacing: 8,
                    alignment: WrapAlignment.start,
                    children: [
                      ...skills.elementAt(i).value.map<Widget>((s) {
                        return SkillItem(
                          isMobile: true,
                          skill: s,
                          color: AppColors.trioColors.elementAt(i),
                        );
                      }),
                    ],
                  ),
                ],
              ),
              const Gap(32),
            ],
          ],
        ),
      ),
    );
  }
}

class _CustomTextSpan extends StatelessWidget {
  const _CustomTextSpan({required this.color, required this.title});

  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '{ ',
            style: context.textStyle.titleMdMedium.copyWith(
              color: color,
              fontSize: 24,
            ),
          ),
          TextSpan(
            text: title,
            style: context.textStyle.titleMdMedium.copyWith(
              color: context.theme.colorScheme.onSurface,
              fontSize: 24,
            ),
          ),
          TextSpan(
            text: ' }',
            style: context.textStyle.titleMdMedium.copyWith(
              color: color,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}
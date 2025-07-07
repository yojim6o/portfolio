import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/constants/app_constants.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/features/testimony/presentation/skill_item.dart';

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
          child: _SkillListContent(),
        ),
      ],
    );
  }
}

class _SkillListContent extends StatelessWidget {
  const _SkillListContent();

  @override
  Widget build(BuildContext context) {
    return context.isDesktopOrTable
        ? _DesktopSkillsContainer()
        : _MobileSkillsContainer();
  }
}

class _DesktopSkillsContainer extends StatelessWidget {
  const _DesktopSkillsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _SkillColumnDesktop(text: 'languages')),
        const Gap(8),
        Expanded(child: _SkillColumnDesktop(text: 'frameworks')),
        const Gap(8),
        Expanded(child: _SkillColumnDesktop(text: 'tools&others')),
      ],
    );
  }
}

class _SkillColumnDesktop extends StatelessWidget {
  const _SkillColumnDesktop({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '{$text}',
          style: context.textStyle.titleLgBold.copyWith(fontSize: 24),
        ),
        const Gap(16),
        Column(
          spacing: 8,
          children:
              AppSkills.skillCategories[text]?.entries.map<Widget>((e) {
                return SkillItem(
                  iconPath: e.value['icon'],
                  title: e.key.toUpperCase(),
                  description: e.value['description'](context),
                  color: e.value['color'](context.isDark),
                );
              }).toList() ??
              [],
        ),
      ],
    );
  }
}

class _MobileSkillsContainer extends StatelessWidget {
  const _MobileSkillsContainer();

  @override
  Widget build(BuildContext context) {
    const itemCount = 10;
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (index.isEven) {
            return SkillItem(
              title: 'Java',
              description: "",
              iconPath: AppIcon.java,
              color: Colors.greenAccent,
            );
          } else {
            return const Gap(16); // separator
          }
        },
        childCount: itemCount * 2 - 1, // 9 gaps between 10 items
      ),
    );
  }
}
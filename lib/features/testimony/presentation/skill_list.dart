import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/constants/app_constants.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/features/testimony/presentation/skill_item.dart';
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

  final colors = [AppColors.pietYellow, AppColors.pietGreen, AppColors.pietRed];
  final skills = AppSkills.skillCategories.entries.toList();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < 3; i++) ...[
          Expanded(
            child: _SkillColumnDesktop(
              textChild: _CustomTextSpan(
                color: colors.elementAt(i),
                title: skills.elementAt(i).key,
              ),
              contentChild: skills.elementAt(i).value.entries.map<Widget>((e) {
                return SkillItem(
                  iconPath: e.value['icon'],
                  title: e.key.toUpperCase(),
                  description: e.value['description'](context),
                  color: colors.elementAt(i),
                );
              }).toList(),
            ),
          ),
          const Gap(8),
        ],
      ],
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

class _SkillColumnDesktop extends StatelessWidget {
  const _SkillColumnDesktop({
    required this.textChild,
    required this.contentChild,
  });

  final Widget textChild;
  final List<Widget> contentChild;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        textChild,
        const Gap(16),
        Column(spacing: 8, children: contentChild),
      ],
    );
  }
}

class _MobileSkillsContainer extends StatelessWidget {
  _MobileSkillsContainer();

  final colors = [AppColors.pietYellow, AppColors.pietGreen, AppColors.pietRed];
  final skills = AppSkills.skillCategories.entries.toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          for (int i = 0; i < skills.length; i++) ...[
            Column(
              children: [
                _CustomTextSpan(
                  color: colors.elementAt(i),
                  title: skills.elementAt(i).key,
                ),
                Gap(8),
                Wrap(
                  direction: Axis.horizontal,
                  spacing: 8,
                  runSpacing: 8,
                  alignment: WrapAlignment.start,
                  children: [
                    ...skills.elementAt(i).value.entries.map<Widget>((e) {
                      return FractionallySizedBox(
                        widthFactor: 0.3,
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadiusGeometry.circular(999),
                              border: Border.fromBorderSide(
                                BorderSide(
                                  color: colors.elementAt(i),
                                  width: 0.5,
                                ),
                              ),
                              gradient: LinearGradient(
                                stops: [0.09, 0.109, 0.11, 1],
                                colors: [
                                  colors.elementAt(i),
                                  colors.elementAt(i),
                                  AppColors.pietWhite,
                                  AppColors.pietWhite,
                                ],
                              ),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                e.value['icon'],
                                height: 64,
                                width: 64,
                              ),
                            ),
                          ),
                        ),
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
    );

    /*const itemCount = 10;
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
    );*/
  }
}
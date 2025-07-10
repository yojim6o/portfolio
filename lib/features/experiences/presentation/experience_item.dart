import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/widgets/geometry/square.dart';

import '../../../constants/app_constants.dart';
import '../../../style/app_colors.dart';

const double expWidth = 300;
const double expHeight = 230;

class ExperienceItem extends StatelessWidget {
  const ExperienceItem({super.key, required this.experience});

  final Experience experience;

  @override
  Widget build(BuildContext context) {
    final List<String> descriptions = experience.descriptionItems(context);
    return Material(
      elevation: 10,
      child: Container(
        width: expWidth,
        height: expHeight,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 4),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 0.4,
                    color: context.theme.colorScheme.onSurface,
                  ),
                ),
              ),

              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: experience.title,
                      style: context.textStyle.bodyLgBold.copyWith(
                        color: context.theme.colorScheme.onSurface,
                      ),
                    ),
                    TextSpan(text: " "),
                    TextSpan(
                      text: '${experience.start.year} ~ ',
                      style: context.textStyle.bodyMdMedium.copyWith(
                        color: context.theme.colorScheme.onSurface.withAlpha(
                          230,
                        ),
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                      text: '${experience.end?.year ?? ""}',
                      style: context.textStyle.bodyMdMedium.copyWith(
                        color: context.theme.colorScheme.onSurface.withAlpha(
                          230,
                        ),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Gap(16),
            Expanded(
              child: Column(
                children: [
                  for (int i = 0; i < descriptions.length; i++)
                    _ExperienceDescriptionItem(
                      text: descriptions.elementAt(i),
                      index: i,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExperienceDescriptionItem extends StatelessWidget {
  _ExperienceDescriptionItem({required this.text, required this.index});

  final String text;
  final int index;
  final Random rnd = Random();

  @override
  Widget build(BuildContext context) {
    final Color color = AppColors.customColorsList.elementAt(index % 4);

    return Container(
      margin: EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Square(color: color, size: 4),
          const Gap(6),
          Expanded(
            child: Text(
              text,
              style: context.textStyle.bodyMdMedium.copyWith(
                color: context.theme.colorScheme.onSurface,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
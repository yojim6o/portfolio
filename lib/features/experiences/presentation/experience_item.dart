import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';

import '../../../constants/app_constants.dart';
import '../../../widgets/styled_card.dart';

const double expWidth = 300;
const double expHeight = 230;

class ExperienceItem extends StatelessWidget {
  const ExperienceItem({super.key, required this.experience});

  final Experience experience;

  @override
  Widget build(BuildContext context) {
    return StyledCard(
      borderEffect: true,
      width: expWidth,
      height: expHeight,
      child: Column(
        children: [
          RichText(
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
                  style: context.textStyle.titleSmBold.copyWith(
                    color: context.theme.colorScheme.onSurface.withAlpha(230),
                    fontSize: 14,
                  ),
                ),
                TextSpan(
                  text: '${experience.end?.year ?? ""}',
                  style: context.textStyle.titleSmBold.copyWith(
                    color: context.theme.colorScheme.onSurface.withAlpha(230),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const Gap(16),
          Expanded(
            child: Column(
              children: [
                for (final desc in experience.descriptionItems(context))
                  _ExperienceDescriptionItem(text: desc),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ExperienceDescriptionItem extends StatelessWidget {
  const _ExperienceDescriptionItem({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 4,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.theme.colorScheme.onSurface,
          ),
        ),
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
    );
  }
}
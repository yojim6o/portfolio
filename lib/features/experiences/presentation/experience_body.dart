import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/constants/app_constants.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/widgets/home_title_subtitle.dart';

import '../../../widgets/styled_card.dart';

final expList = AppExperiences.experiences;
const expPointsSize = 16;
const expScaleFactor = 150.0;
const expPointsFactor = (expHeight / 2) - (expPointsSize / 2);

class ExperienceBody extends StatelessWidget {
  const ExperienceBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeTitleSubtitle(
          title: context.text.experiences,
          subtitle: context.text.experiencesDescription,
        ),
        Gap(32),
        Center(
          child: context.isDesktop
              ? DesktopExperiencesBody()
              : MobileExperiencesBody(),
        ),
      ],
    );
  }
}

class DesktopExperiencesBody extends StatelessWidget {
  const DesktopExperiencesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: expList.length * expScaleFactor + expScaleFactor,
      child: Stack(
        children: [
          Center(
            child: Container(
              width: 3,
              height: expList.length * expScaleFactor + expScaleFactor,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    context.theme.colorScheme.primary.withAlpha(1),
                    context.theme.colorScheme.primary,
                    context.theme.colorScheme.primary.withAlpha(1),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          for (int i = 0; i < expList.length; i++) ...[
            if (i.isEven)
              Positioned(
                top: i * expScaleFactor,
                right: 400,
                left: 0,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ExperienceItem(experience: expList.elementAt(i)),
                    SizedBox(
                      width: 100,
                      child: DottedLine(
                        dashColor: context.theme.colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              )
            else
              Positioned(
                top: i * 150,
                left: 400,
                right: 0,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      child: DottedLine(
                        dashColor: context.theme.colorScheme.onSurface,
                      ),
                    ),
                    ExperienceItem(experience: expList.elementAt(i)),
                  ],
                ),
              ),
            Positioned(
              top: i * expScaleFactor.toDouble() + expPointsFactor,
              right: 0,
              left: 0,
              child: Container(
                alignment: Alignment.center,
                width: expPointsSize.toDouble(),
                height: expPointsSize.toDouble(),
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.onSurface.withAlpha(50),
                  shape: BoxShape.circle,
                ),
                child: Container(
                  alignment: Alignment.center,
                  width: expPointsSize.toDouble() / 2,
                  height: expPointsSize.toDouble() / 2,
                  decoration: BoxDecoration(
                    color: context.theme.colorScheme.onSurface.withAlpha(
                      210,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class MobileExperiencesBody extends StatelessWidget {
  const MobileExperiencesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < expList.length; i++) ...[
          ExperienceItem(experience: expList[i]),

          if (i < expList.length - 1)
            SizedBox(
              height: 60,
              child: DottedLine(
                dashColor: context.theme.colorScheme.onSurface,
                direction: Axis.vertical,
                lineThickness: 4,
              ),
            ),
        ],
      ],
    );
  }
}

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
                    color: context.theme.colorScheme.onSurface.withAlpha(
                      230,
                    ),
                    fontSize: 14,
                  ),
                ),
                TextSpan(
                  text: '${experience.end?.year ?? ""}',
                  style: context.textStyle.titleSmBold.copyWith(
                    color: context.theme.colorScheme.onSurface.withAlpha(
                      230,
                    ),
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
        Gap(6),
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
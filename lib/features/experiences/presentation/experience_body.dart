import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/constants/app_constants.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/widgets/home_title_subtitle.dart';

import 'experience_item.dart';

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
                    color: context.theme.colorScheme.onSurface.withAlpha(210),
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
              ),
            ),
        ],
      ],
    );
  }
}
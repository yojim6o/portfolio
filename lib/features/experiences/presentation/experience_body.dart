import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/widgets/home_title_subtitle.dart';

import '../../../widgets/styled_card.dart';

const expLen = 6;
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
        context.isDesktop ? DesktopExperiencesBody() : MobileExperiencesBody(),
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
      height: expLen * expScaleFactor + expScaleFactor,
      child: Stack(
        children: [
          Center(
            child: Container(
              width: 3,
              height: expLen * expScaleFactor + expScaleFactor,
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
          for (int i = 0; i < expLen; i++) ...[
            if (i.isEven)
              Positioned(
                top: i * expScaleFactor,
                right: 400,
                left: 0,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ExperienceItem(),
                    SizedBox(
                      width: 100,
                      child: DottedLine(
                        dashColor: context.theme.colorScheme.onBackground,
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
                        dashColor: context.theme.colorScheme.onBackground,
                      ),
                    ),
                    ExperienceItem(),
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
                  color: context.theme.colorScheme.onBackground.withAlpha(50),
                  shape: BoxShape.circle,
                ),
                child: Container(
                  alignment: Alignment.center,
                  width: expPointsSize.toDouble() / 2,
                  height: expPointsSize.toDouble() / 2,
                  decoration: BoxDecoration(
                    color: context.theme.colorScheme.onBackground.withAlpha(
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
    return Center(
      child: Column(
        children: [
          ExperienceItem(),
          SizedBox(
            height: 60,
            child: DottedLine(
              dashColor: Colors.white,
              direction: Axis.vertical,
            ),
          ),
          ExperienceItem(),
          SizedBox(
            height: 60,
            child: DottedLine(
              dashColor: Colors.white,
              direction: Axis.vertical,
            ),
          ),
          ExperienceItem(),
          SizedBox(
            height: 60,
            child: DottedLine(
              dashColor: Colors.white,
              direction: Axis.vertical,
            ),
          ),
          ExperienceItem(),
        ],
      ),
    );
  }
}

const double expWidth = 300;
const double expHeight = 230;

class ExperienceItem extends StatelessWidget {
  const ExperienceItem({super.key});

  @override
  Widget build(BuildContext context) {
    return StyledCard(
      borderEffect: true,
      width: expWidth,
      height: expHeight,
      child: Column(
        children: [
          Text(
            'Experience title',
            style: context.textStyle.bodyLgBold.copyWith(
              color: context.theme.colorScheme.onBackground,
            ),
          ),
          Expanded(
            child: Column(
              children: [
                _ExperienceDescriptionItem(),
                _ExperienceDescriptionItem(),
                _ExperienceDescriptionItem(),
                _ExperienceDescriptionItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ExperienceDescriptionItem extends StatelessWidget {
  const _ExperienceDescriptionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 4,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.theme.colorScheme.onBackground,
          ),
        ),
        Gap(6),
        Expanded(
          child: Text(
            'Description item',
            style: context.textStyle.bodyMdMedium.copyWith(
              color: context.theme.colorScheme.onBackground,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
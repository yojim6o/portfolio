import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/style/app_size.dart';
import 'package:portfolio/widgets/appbar/seo_text.dart';

import '../../../style/app_colors.dart';

class HeroText extends StatelessWidget {
  const HeroText({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      options: RectDottedBorderOptions(
        color: AppColors.pietBlack,
        padding: EdgeInsets.all(0),
      ),
      child: Container(
        padding: EdgeInsets.all(context.insets.padding),
        color: context.theme.colorScheme.surfaceDim.withAlpha(240),
        child: Column(
          crossAxisAlignment: context.isDesktopOrTable
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          children: [
            SeoText(
              context.text.g1,
              textAlign: context.isDesktopOrTable
                  ? TextAlign.left
                  : TextAlign.center,
              textStyle: context.textStyle.titleLgBold.copyWith(
                color: context.theme.colorScheme.onSurface,
              ),
              //textRenderer: TextRendererStyle.header1,
            ),
            Gap(Insets.sm),
            SeoText(
              context.text.g2,
              textAlign: context.isDesktopOrTable
                  ? TextAlign.left
                  : TextAlign.center,
              textStyle: context.textStyle.titleMdMedium.copyWith(
                color: context.theme.colorScheme.onSurface,
              ),
              //textRenderer: TextRendererStyle.header2,
            ),
            Gap(Insets.lg),
            SeoText(
              context.text.g3,
              textAlign: context.isDesktopOrTable
                  ? TextAlign.left
                  : TextAlign.center,
              textStyle: context.textStyle.bodyMdMedium.copyWith(
                color: context.theme.colorScheme.onSurface,
              ),
              //textRenderer: TextRendererStyle.header3,
            ),
          ],
        ),
      ),
    );
  }
}
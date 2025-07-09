import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/style/app_colors.dart';
import 'package:portfolio/style/app_size.dart';
import 'package:portfolio/widgets/appbar/seo_text.dart';

class HeroText extends StatelessWidget {
  const HeroText({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      /*options: RectDottedBorderOptions(
        color: AppColors.pietBlack,
        padding: EdgeInsets.all(0),
      ),*/
      child: Container(
        padding: EdgeInsets.all(context.insets.padding),
        color: context.theme.colorScheme.surfaceBright,
        child: Column(
          crossAxisAlignment: context.isDesktopOrTable
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'G',
                    style: context.textStyle.titleLgBold.copyWith(
                      color: AppColors.pietYellow,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: "abriel ",
                    style: context.textStyle.titleLgBold.copyWith(
                      color: context.theme.colorScheme.onSurface,
                    ),
                  ),
                  TextSpan(
                    text: 'E',
                    style: context.textStyle.titleLgBold.copyWith(
                      color: AppColors.pietGreen,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: "nguídanos ",
                    style: context.textStyle.titleLgBold.copyWith(
                      color: context.theme.colorScheme.onSurface,
                    ),
                  ),
                  TextSpan(
                    text: 'N',
                    style: context.textStyle.titleLgBold.copyWith(
                      color: AppColors.pietRed,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: "ebot",
                    style: context.textStyle.titleLgBold.copyWith(
                      color: context.theme.colorScheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),
            /*SeoText(
              context.text.g1,
              textAlign: context.isDesktopOrTable
                  ? TextAlign.left
                  : TextAlign.center,
              textStyle: context.textStyle.titleLgBold.copyWith(
                color: context.theme.colorScheme.onSurface,
              ),
              //textRenderer: TextRendererStyle.header1,
            ),*/
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
            ),
          ],
        ),
      ),
    );
  }
}
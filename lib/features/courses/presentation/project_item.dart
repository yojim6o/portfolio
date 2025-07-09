import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/constants/app_constants.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:portfolio/widgets/appbar/seo_text.dart';

import '../../../style/app_colors.dart';
import '../../../widgets/appbar/styled_buttons.dart';

class ProjectItem extends StatelessWidget {
  const ProjectItem(this.project, {super.key});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.colorScheme.surfaceBright.withAlpha(15),
        gradient: RadialGradient(
          tileMode: TileMode.clamp,
          stops: [
            0.0,
            0.259,
            0.26,
            0.269,
            0.27,
            0.409,
            0.41,
            0.419,
            0.42,
            0.759,
            0.76,
            0.769,
            0.77,
          ],
          colors: [
            AppColors.pietYellow,
            AppColors.pietYellow,
            Colors.black,
            Colors.black,
            AppColors.pietGreen,
            AppColors.pietGreen,
            Colors.black,
            Colors.black,
            AppColors.pietBlue,
            AppColors.pietBlue,
            Colors.black,
            Colors.black,
            AppColors.pietRed,
          ],
          radius: 2,
          center: Alignment.center,
          focal: Alignment.centerLeft,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Row(
                spacing: 16,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (final path in project.imagePaths)
                    Flexible(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(2.5),
                        ),
                        child: Image.asset(path, fit: BoxFit.fill),
                      ),
                    ),
                ],
              ),
            ),
            Gap(24),
            SeoText(
              project.title,
              textStyle: context.textStyle.bodyLgBold.copyWith(
                color: context.theme.colorScheme.onSurface,
              ),
            ),
            const Gap(8),
            Flexible(
              child: SeoText(
                project.description(context),
                textStyle: context.textStyle.bodyMdMedium.copyWith(
                  color: context.theme.colorScheme.onSurface,
                ),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Gap(16),
            PrimaryButton(
              title: "Go to repo",
              onPressed: () => Utils.launchUri(Uri.parse(project.url)),
            ),
          ],
        ),
      ),
    );
  }
}
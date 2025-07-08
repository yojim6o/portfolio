import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/constants/app_constants.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/widgets/appbar/seo_text.dart';
import 'package:portfolio/widgets/styled_card.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../widgets/appbar/styled_buttons.dart';

class ProjectItem extends StatelessWidget {
  const ProjectItem(this.project, {super.key});

  final Project project;

  Future<void> _launchUri(Uri uri) async {
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {}
  }

  @override
  Widget build(BuildContext context) {
    return StyledCard(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 286),
        child: AspectRatio(
          aspectRatio: 0.7,
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1.5,
                child: Row(
                  spacing: 16,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (final path in project.imagePaths)
                      Flexible(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(4),
                          ),
                          child: Image.asset(path, fit: BoxFit.cover),
                        ),
                      ),
                  ],
                ),
              ),
              Gap(24),
              Expanded(
                child: Column(
                  children: [
                    SeoText(
                      project.title,
                      textStyle: context.textStyle.bodyLgBold.copyWith(
                        color: context.theme.colorScheme.onSurface,
                      ),
                    ),
                    Gap(8),
                    Expanded(
                      child: SeoText(
                        project.description(context),
                        textStyle: context.textStyle.bodyMdMedium.copyWith(
                          color: context.theme.colorScheme.onSurface,
                        ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    PrimaryButton(
                      title: "Go to repo",
                      onPressed: () => _launchUri(Uri.parse(project.url)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
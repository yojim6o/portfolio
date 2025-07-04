import 'package:flutter/cupertino.dart';
import 'package:portfolio/extensions.dart';

import 'appbar/seo_text.dart';

class HomeTitleSubtitle extends StatelessWidget {
  const HomeTitleSubtitle({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SeoText(
            '#$title',
            textStyle: context.textStyle.titleSmBold.copyWith(
              color: context.theme.colorScheme.onBackground,
            ),
            //textRenderer: TextRendererStyle.header1,
          ),
          SeoText(
            subtitle,
            textStyle: context.textStyle.bodyMdMedium.copyWith(
              color: context.theme.colorScheme.onBackground,
            ),
            //textRenderer: TextRendererStyle.header1,
          ),
        ],
      ),
    );
  }
}
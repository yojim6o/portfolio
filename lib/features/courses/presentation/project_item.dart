import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/widgets/appbar/seo_text.dart';
import 'package:portfolio/widgets/styled_card.dart';

class CourseItem extends StatelessWidget {
  const CourseItem({super.key});

  @override
  Widget build(BuildContext context) {
    return StyledCard(
      child: AspectRatio(
        aspectRatio: 0.7,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.5,
              child: ClipRect(
                child: Image.network(
                  'https://images.unsplash.com/photo-1750797636255-8c939940bcad?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw1fHx8ZW58MHx8fHx8',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Gap(24),
            SeoText(
              'RandomText',
              textStyle: context.textStyle.bodyLgBold.copyWith(
                color: context.theme.colorScheme.onSurface,
              ),
            ),
            Gap(8),
            Expanded(
              child: SeoText(
                'Some description text for testing',
                textStyle: context.textStyle.bodyMdMedium.copyWith(
                  color: context.theme.colorScheme.onSurface,
                ),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
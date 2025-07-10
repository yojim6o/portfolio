import 'package:flutter/material.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/widgets/appbar/seo_text.dart';

import '../../style/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.title, this.onPressed});

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: AppColors.pietWhite,
        ),
      ),
    );
  }
}

class OutlineButton extends StatelessWidget {
  const OutlineButton({super.key, required this.title, this.onPressed});

  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        side: WidgetStateProperty.resolveWith((states) {
          return BorderSide(color: context.theme.colorScheme.onSurface);
        }),
      ),
      child: SeoText(
        title,
        textStyle: TextStyle(
          fontWeight: FontWeight.w500,
          color: context.theme.colorScheme.onSurface,
        ),
      ),
    );
  }
}
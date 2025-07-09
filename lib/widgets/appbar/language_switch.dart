import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/widgets/appbar/seo_text.dart';

import '../../constants/app_constants.dart';
import '../../shared/app_locale_controller.dart';

class LanguageSwitch extends ConsumerWidget {
  const LanguageSwitch({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final locale = ref.watch(appLocaleControllerProvider);

    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: 0,
            child: PopUpLanguageSwitchItem(
              language: 'English',
              icon: AppIcon.en,
            ),
          ),
          PopupMenuItem(
            value: 1,
            child: PopUpLanguageSwitchItem(
              language: 'Español',
              icon: AppIcon.es,
            ),
          ),
        ];
      },
      initialValue: locale.value == 'en' ? 0 : 1,
      onSelected: (value) {
        if (value == 0) {
          ref.read(appLocaleControllerProvider.notifier).changeLocale('en');
        } else {
          ref.read(appLocaleControllerProvider.notifier).changeLocale('es');
        }
      },
      child: Row(
        children: [
          Icon(
            Icons.language,
            color: context.theme.colorScheme.onSurface.withAlpha(200),
          ),
          const Gap(4),
          SeoText(locale.value?.toUpperCase() ?? 'En'),
        ],
      ),
    );
  }
}

class PopUpLanguageSwitchItem extends StatelessWidget {
  const PopUpLanguageSwitchItem({
    super.key,
    required this.language,
    required this.icon,
  });

  final String language;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon, width: 18, height: 18),
        const Gap(8),
        SeoText(language),
      ],
    );
  }
}
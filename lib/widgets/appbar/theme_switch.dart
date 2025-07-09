import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/shared/app_theme_controller.dart';

class ThemeSwitch extends ConsumerWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(appThemeControllerProvider);
    return Switch(
      hoverColor: context.theme.colorScheme.onSurface.withAlpha(250),
      activeColor: context.theme.colorScheme.onSurface,
      splashRadius: 15,

      value: state.value == ThemeMode.dark,
      onChanged: (value) {
        ref
            .read(appThemeControllerProvider.notifier)
            .changeTheme(value ? ThemeMode.dark : ThemeMode.light);
      },
    );
  }
}
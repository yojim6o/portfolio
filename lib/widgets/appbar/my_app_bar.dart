import 'package:flutter/material.dart';
import 'package:portfolio/constants/app_constants.dart';
import 'package:portfolio/constants/app_menu_list.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/style/app_gradients.dart';
import 'package:portfolio/style/app_size.dart';
import 'package:portfolio/style/app_text_styles.dart';
import 'package:portfolio/utils/utils.dart';
import 'package:portfolio/widgets/appbar/app_bar_wrapper_icon.dart';
import 'package:portfolio/widgets/appbar/drawer_menu.dart';
import 'package:portfolio/widgets/appbar/language_switch.dart';
import 'package:portfolio/widgets/appbar/theme_switch.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: AppGradients.appBarGradient(
              radius: (context.mq.size.width * 0.008267) + 1,
            ),
            border: Border(
              bottom: BorderSide(
                width: 2.5,
                color: context.theme.colorScheme.onSurface,
              ),
            ),
          ),
          child: AnimatedContainer(
            alignment: Alignment.center,
            duration: const Duration(milliseconds: 200),
            padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
            height: context.insets.appBarHeight,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: Insets.maxWidth),
              child: Row(
                children: [
                  AppLogo(),
                  Spacer(),
                  if (context.isDesktop)
                    MenuList(wrapper: (children) => Row(children: children)),
                  Spacer(),
                  Row(spacing: 16, children: [LanguageSwitch(), ThemeSwitch()]),
                  if (!context.isDesktop) AppBarWrapperIcon(),
                ],
              ),
            ),
          ),
        ),
        if (!context.isDesktop) DrawerMenu(),
      ],
    );
  }
}

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Portfolio',
      style: context.textStyle.titleLgBold.copyWith(
        fontWeight: FontWeight.w500,
        color: context.theme.colorScheme.onSurface,
      ),
    );
  }
}

class MenuList extends StatelessWidget {
  final Flex Function(List<Widget> children) wrapper;

  const MenuList({super.key, required this.wrapper});

  @override
  Widget build(BuildContext context) {
    final children = AppMenuList.getItems(context)
        .map<Widget>(
          (e) => LargeAppBarMenuItem(
            text: e.title,
            isSelected: true,
            onTap: () => Utils.scrollToSection(Keys.homeKey),
          ),
        )
        .toList();
    return wrapper(children);
  }
}

class LargeAppBarMenuItem extends StatelessWidget {
  const LargeAppBarMenuItem({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Insets.med,
          vertical: Insets.xs,
        ),
        child: Text(
          text,
          style: SmallTextStyle().bodyLgMedium.copyWith(
            color: context.theme.colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
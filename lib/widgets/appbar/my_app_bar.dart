import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants/app_menu_list.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/style/app_colors.dart';
import 'package:portfolio/style/app_size.dart';
import 'package:portfolio/style/app_text_styles.dart';
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
              radius: 12,
              center: Alignment.center,
              focal: Alignment.bottomLeft,
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
            color: context.theme.appBarTheme.backgroundColor,
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
        fontFamily: GoogleFonts.bricolageGrotesque().fontFamily,
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
            onTap: () {},
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
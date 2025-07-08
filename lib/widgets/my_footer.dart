import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/constants/app_constants.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/widgets/appbar/my_app_bar.dart';
import 'package:portfolio/widgets/powered_by_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MyFooter extends StatelessWidget {
  const MyFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.appBarTheme.backgroundColor,
      ),
      padding: EdgeInsets.all(context.insets.appBarHeight),
      child: Column(
        children: [
          context.isDesktop ? _DesktopFooter() : _PhoneFooter(),
          const Divider(height: 24),
          const PoweredByFlutter(),
        ],
      ),
    );
  }
}

class _DesktopFooter extends StatelessWidget {
  const _DesktopFooter();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppLogo(),
        Spacer(),
        MenuList(wrapper: (children) => Row(children: children)),
        Spacer(),
        _FooterLinks(),
      ],
    );
  }
}

class _PhoneFooter extends StatelessWidget {
  const _PhoneFooter();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppLogo(),
        MenuList(wrapper: (children) => Column(children: children)),
        _FooterLinks(),
      ],
    );
  }
}

class _FooterLinks extends StatelessWidget {
  const _FooterLinks();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _FooterLinkItem(uri: AppUrl.linkedinUri, icon: AppIcon.linkedin),
        _FooterLinkItem(uri: AppUrl.githubUri, icon: AppIcon.github),
      ],
    );
  }
}

class _FooterLinkItem extends StatelessWidget {
  const _FooterLinkItem({required this.icon, required this.uri});

  final Uri uri;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _launchUri,
      icon: SvgPicture.asset(
        icon,
        colorFilter: ColorFilter.mode(
          context.theme.colorScheme.onSurface,
          BlendMode.srcIn,
        ),
      ),
    );
  }

  Future<void> _launchUri() async {
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {}
  }
}
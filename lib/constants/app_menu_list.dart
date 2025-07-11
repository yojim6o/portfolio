import 'package:flutter/cupertino.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/routes/app_route.dart';

class AppMenuList {
  AppMenuList._();

  static List<_AppMenu> getItems(BuildContext context) {
    return [_AppMenu(title: context.text.home, path: Routes.home)];
  }
}

class _AppMenu {
  final String title;
  final String path;

  _AppMenu({required this.title, required this.path});
}
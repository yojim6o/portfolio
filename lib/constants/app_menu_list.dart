import 'package:flutter/cupertino.dart';
import 'package:portfolio/extensions.dart';
import 'package:portfolio/routes/app_route.dart';

class AppMenuList {
  static List<AppMenu> getItems(BuildContext context) {
    return [
      AppMenu(title: context.text.home, path: Routes.home),
      AppMenu(title: context.text.courses, path: Routes.courses),
      AppMenu(title: context.text.blog, path: Routes.blog),
      AppMenu(title: context.text.about, path: Routes.about),
    ];
  }
}

class AppMenu {
  final String title;
  final String path;

  AppMenu({required this.title, required this.path});
}
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  Utils._();

  static Future<void> launchUri(Uri uri) async {
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {}
  }

  static void scrollToSection(GlobalKey key) async {
    await Scrollable.ensureVisible(
      key.currentContext!,
      duration: Duration(milliseconds: 700),
      curve: Curves.easeInOutCubic,
    );
  }
}
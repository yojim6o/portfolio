import 'package:url_launcher/url_launcher.dart';

class Utils {
  Utils._();

  static Future<void> launchUri(Uri uri) async {
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {}
  }
}
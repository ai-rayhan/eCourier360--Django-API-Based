import 'package:url_launcher/url_launcher.dart';

class AppUrlLauncher{
  static Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
  static Future<void> openEmail(String email) async {
    final Uri launchUri = Uri(
    scheme: 'mailto',
    path: email,
  );
    await launchUrl(launchUri);
  }
}
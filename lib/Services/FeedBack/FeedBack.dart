import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedBack {
  /// Central helper — reuse across the entire app.
  /// Pre-fills To, Subject, and Body so the developer gets context immediately.
  Future<void> sendEmailTo({
    required String email,
    String subject = '',
    String body = '',
  }) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        if (subject.isNotEmpty) 'subject': subject,
        if (body.isNotEmpty) 'body': body,
      },
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      // In production: show a SnackBar or dialog instead of just printing
      debugPrint('No email client found on this device.');
    }
  }
}

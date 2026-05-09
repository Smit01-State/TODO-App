import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Updateurl {
  Future<void> openGitHub(BuildContext context) async {
    final uri = Uri.parse('https://github.com/Smit01-State/TODO-App/releases/');
    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Could not open link')));
      }
    }
  }
}

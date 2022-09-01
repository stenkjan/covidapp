import 'package:flutter/material.dart';
import 'package:covidapp/covidapp/login/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  /// Widget build  */
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Center(
            child: TextButton.icon(
          label: const Text(
            'oder kontaktieren Sie uns',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          icon: const Icon(Icons.mail_rounded, color: Colors.grey, size: 20),
          onPressed: () {
            _launchURL();
          },
        )),
        const SizedBox(
          height: appPadding,
        ),
      ],
    );
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  /// Redirecting to Email */

  void _launchURL() async {
    final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: 'jan.stenk@edu.fh-joanneum.at',
        query: encodeQueryParameters(
            <String, String>{'Long Covid App Support': 'Ihr Anliegen:'}));
   

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    } else {
      throw 'Could not launch $Uri';
    }
  }
}

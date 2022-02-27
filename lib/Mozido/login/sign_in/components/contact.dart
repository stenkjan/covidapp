import 'package:flutter/material.dart';
import 'package:covidapp/Mozido/login/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

/** Widget build  */
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Center(
            child:
                // Column(
                //   children: [
                // TextButton(
                //     child: const Text(
                //       'oder kontaktieren Sie uns  \u{1F4E7}',
                //       style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                //     ),
                //     onPressed: () {

                //     }),
                TextButton.icon(
          label: const Text(
            'oder kontaktieren Sie uns',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          icon: const Icon(Icons.mail_rounded, color: Colors.grey, size: 20),
          onPressed: () {
            _launchURL();
          },
        )
            // ],
            // ),
            ),
        const SizedBox(
          height: appPadding,
        ),
        /*  AccountCheck(
          login: true,
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SignUpScreen();
                },
              ),
            );
          },
        ), */
      ],
    );
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

/** Redirecting to Email */

  void _launchURL() async {
    final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: 'jan.stenk@edu.fh-joanneum.at',
        query: encodeQueryParameters(
            <String, String>{'Long Covid App Support': 'Ihr Anliegen:'}));
    //  launch(emailLaunchUri.toString());
    // if (!await launch("mailto:")) throw 'Could not launch $_url';
    if (await canLaunch(emailLaunchUri.toString())) {
      await launch(emailLaunchUri.toString());
    } else {
      throw 'Could not launch $Uri';
    }
  }
}

import 'package:flutter/material.dart';
import 'package:covidapp/Mozido/login/constants.dart';
import 'package:covidapp/Mozido/login/sign_up/signup.dart';
import 'package:covidapp/Mozido/login/widgets/account_check.dart';
import 'package:covidapp/Mozido/login/widgets/rounded_button.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        Center(
          child: TextButton(
              child: const Text(
                'oder kontaktieren Sie uns  \u{1F4E7}',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              ),
              onPressed: () {
                _launchURL();
              }),
        ),
        SizedBox(
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

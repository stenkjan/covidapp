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
              child: Text(
                'oder kontaktieren Sie uns  \u{1F4E7}',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              ),
              onPressed: () {
                // Android: Will open mail app or show native picker.
                // iOS: Will open mail app if single mail app found.
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

  void _launchURL() async {
    // if (!await launch("mailto:")) throw 'Could not launch $_url';
  }
}

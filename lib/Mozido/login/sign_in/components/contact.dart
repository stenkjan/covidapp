import 'package:flutter/material.dart';
import 'package:covidapp/Mozido/login/constants.dart';
import 'package:covidapp/Mozido/login/sign_up/signup.dart';
import 'package:covidapp/Mozido/login/widgets/account_check.dart';
import 'package:covidapp/Mozido/login/widgets/rounded_button.dart';

class Contact extends StatelessWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'oder kontaktieren Sie uns',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: appPadding),
          child:  RoundedButton(imageSrc: 'images/mail.png', press: () {}),

        ),
        SizedBox(
          height: appPadding,
        ),
        AccountCheck(
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
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:covidapp/Mozido/login/constants.dart';
import 'package:covidapp/Mozido/login/sign_in/signin.dart';
import 'package:covidapp/Mozido/login/widgets/account_check.dart';
import 'package:covidapp/Mozido/login/widgets/rounded_button.dart';

class Social extends StatelessWidget {
  const Social({Key? key}) : super(key: key);

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
          child:    RoundedButton(imageSrc: 'images/mail.png', press: () {}),

          ),
        const SizedBox(
          height: appPadding,
        ),
        AccountCheck(
          login: false,
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SignInScreen();
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
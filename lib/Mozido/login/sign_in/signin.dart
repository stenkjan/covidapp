import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covidapp/Mozido/login/constants.dart';
import 'components/contact.dart';
import 'components/credentials.dart';
import 'components/head_text.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                lightPrimary,
                darkPrimary,
              ]
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              HeadText(),
              Credentials(),
              Contact(),
            ],
          ),
        ),
      ),
    );
  }
}
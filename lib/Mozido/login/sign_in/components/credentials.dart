import 'package:covidapp/Mozido/services/auth_service.dart';

import 'package:flutter/material.dart';
import 'package:covidapp/Mozido/login/constants.dart';
import 'package:covidapp/Mozido/login/widgets/rectangular_button.dart';
import 'package:covidapp/Mozido/login/widgets/rectangular_input_field.dart';
import 'package:provider/provider.dart';

import '../signin.dart';

class Credentials extends StatelessWidget {
  const Credentials({Key? key}) : super(key: key);
  static bool signed_in = false;
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final authService = Provider.of<AuthService>(context);
    bool signed_in = Credentials.signed_in;
    return Padding(
      padding: const EdgeInsets.all(appPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            textAlign: TextAlign.center,
            controller: emailController,
            decoration: InputDecoration(
                icon: Icon(Icons.email_rounded, color: Colors.white10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[800]),
                hintText: "Email",
                fillColor: Colors.white70),
          ),
          const SizedBox(
            height: appPadding / 2,
          ),
          TextField(
            textAlign: TextAlign.center,
            controller: passwordController,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                icon: Icon(Icons.lock, color: Colors.white10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[800]),
                hintText: "Passwort",
                fillColor: Colors.white70),
          ),
          const SizedBox(
            height: appPadding / 2,
          ),
          const Center(
            child: Text(
              'Passwort vergessen?',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 17,
              ),
            ),
          ),
          RectangularButton(
              text: 'Anmelden',
              press: () async {
                await authService.signInWithEmailAndPassword(
                    emailController.text, passwordController.text);
                signed_in = true;
                signedIn(signed_in);
              })
        ],
      ),
    );
  }

  bool signedIn(bool signed) {
    if (signed) {
      return signed_in = true;
    } else {
      return signed_in = false;
    }
  }
}

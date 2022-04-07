import 'package:covidapp/covidapp/login/sign_up/signup.dart';
import 'package:covidapp/covidapp/services/auth_service.dart';

import 'package:flutter/material.dart';
import 'package:covidapp/covidapp/login/constants.dart';
import 'package:provider/provider.dart';

class Credentials extends StatelessWidget {
  const Credentials({Key? key}) : super(key: key);
  /* static bool signed_in = false; */
  @override
  /// Widget build --- Email, Password fields, Reset Passord  */
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final authService = Provider.of<AuthService>(context);
    /* bool signed_in = Credentials.signed_in; */
    return Padding(
      padding: const EdgeInsets.fromLTRB(7.0, appPadding, 10.5, appPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            textAlign: TextAlign.center,
            controller: emailController,
            decoration: InputDecoration(
                icon: const Icon(Icons.email_rounded, color: Colors.white24),
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
                icon: const Icon(Icons.lock, color: Colors.white24),
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
            child: Padding(
              padding: EdgeInsets.only(left: 30.0),
              child: Text(
                'Passwort vergessen?',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 35.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(150, 30),
                        primary: const Color(0xFF029CF5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: const BorderSide(color: Color(0x815DDFDF)),
                        ),
                      ),
                      child: const Text('Anmelden'),
                      onPressed: () async {
                        // ignore: unnecessary_null_comparison
                        if (emailController.text != null &&
                            // ignore: unnecessary_null_comparison
                            passwordController.text != null) {
                          await authService.signInWithEmailAndPassword(
                              emailController.text, passwordController.text);
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('''
Sie müssen zuerst eine Email und ein Passwort angeben'''),
                          ));
                        }
                        
                      }),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xE53EAF8A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: const BorderSide(color: Color(0x815DDFDF)),
                        ),
                      ),
                      child: const Text('Registrieren'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const SignUpScreen();
                            },
                          ),
                        );
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}

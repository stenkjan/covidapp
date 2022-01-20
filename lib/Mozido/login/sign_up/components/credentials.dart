import 'package:covidapp/Mozido/login/sign_in/signin.dart';
import 'package:covidapp/Mozido/services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covidapp/Mozido/login/constants.dart';
import 'package:covidapp/Mozido/login/widgets/rectangular_button.dart';
import 'package:covidapp/Mozido/login/widgets/rectangular_input_field.dart';
import 'package:provider/provider.dart';

class Credentials extends StatelessWidget {
  const Credentials({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.fromLTRB(7.0, appPadding, 10.5, appPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            textAlign: TextAlign.center,
            controller: emailController,
            decoration: InputDecoration(
                icon: Icon(
                  Icons.email_rounded,
                  color: Colors.white24,
                ),
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
                icon: Icon(Icons.lock, color: Colors.white24),
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
              padding: const EdgeInsets.only(left: 30.0),
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
            height: 30,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xB444B2C5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                        side: BorderSide(color: Color(0x815DDFDF)),
                      ),
                    ),
                    child: const Text('\u{2190}'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const SignInScreen();
                          },
                        ),
                      );
                    }),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(150, 30),
                      primary: Color(0xE53EAF8A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Color(0x815DDFDF)),
                      ),
                    ),
                    child: const Text('Registrieren'),
                    onPressed: () async {
                      if (emailController.text != null &&
                          passwordController.text != null) {
                        await authService.createUserWithEmailAndPasswort(
                            emailController.text, passwordController.text);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              "Sie müssen zuerst eine Email und ein Passwort angeben"),
                        ));
                      }
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

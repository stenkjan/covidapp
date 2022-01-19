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
      padding: const EdgeInsets.all(appPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /* TextField(
            textAlign: TextAlign.center,
            controller: emailController, 
            decoration: InputDecoration(
              icon: Icon(Icons.email_rounded, color: Colors.white10),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      filled: true,
      hintStyle: TextStyle(color: Colors.grey[800]),
      hintText: "Benutzername", 
      fillColor: Colors.white70),
          ), 
          const SizedBox(
            height: appPadding / 2,
          ),*/
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
              text: 'Registrieren',
              press: () async {
                await authService.createUserWithEmailAndPasswort(
                    emailController.text, passwordController.text);
              })
        ],
      ),
    );
  }
}

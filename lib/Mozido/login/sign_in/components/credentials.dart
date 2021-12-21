import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covidapp/Mozido/login/constants.dart';
import 'package:covidapp/Mozido/login/widgets/rectangular_button.dart';
import 'package:covidapp/Mozido/login/widgets/rectangular_input_field.dart';

import '../signin.dart';

class Credentials extends StatelessWidget {
  const Credentials({Key? key}) : super(key: key);
  static bool signed_in = false;
  @override
  Widget build(BuildContext context) {
    bool signed_in = Credentials.signed_in;
    return Padding(
      padding: const EdgeInsets.all(appPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RectangularInputField(
            hintText: 'Email',
            icon: Icons.email_rounded,
            obscureText: false,
          ),
          const SizedBox(
            height: appPadding / 2,
          ),
          const RectangularInputField(
            hintText: 'Passwort',
            icon: Icons.lock,
            obscureText: true,
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
          RectangularButton(text: 'Anmelden', press: (){
            signed_in = true;
            signedIn(signed_in);

          })
        ],
      ),
    );
  }
  bool signedIn (bool signed){

   if (signed)
     {
       return signed_in = true;
     }
   else
     {
       return signed_in = false;
     }
  }
}
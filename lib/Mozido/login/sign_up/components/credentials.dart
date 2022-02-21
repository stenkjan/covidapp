import 'package:covidapp/Mozido/login/sign_in/signin.dart';
import 'package:covidapp/Mozido/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:covidapp/Mozido/login/constants.dart';
import 'package:provider/provider.dart';

class Credentials extends StatefulWidget {
  const Credentials({Key? key}) : super(key: key);

  @override
  State<Credentials> createState() => _CredentialsState();
}

class _CredentialsState extends State<Credentials> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController firstnameController = TextEditingController();
    final TextEditingController lastnameController = TextEditingController();
    final TextEditingController birthdayController = TextEditingController();
    String date = "Geburtstag";
    return Padding(
      padding: const EdgeInsets.fromLTRB(7.0, appPadding, 10.5, appPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: birthdayController,
            textAlign: TextAlign.center,
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: DateTime(2004, 1),
                firstDate: DateTime(1900, 1),
                lastDate: DateTime(2022, 12),
                locale: const Locale('de', 'AT'),
              ).then((pickedDate) {
                setState(() {
                  date = pickedDate.toString();
                });
              });
            },
            decoration: InputDecoration(
                icon: const Icon(
                  Icons.date_range,
                  color: Colors.white24,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[800]),
                hintText: date,
                fillColor: Colors.white70),
          ),
          const SizedBox(
            height: appPadding / 2,
          ),
          TextField(
            textAlign: TextAlign.center,
            controller: firstnameController,
            decoration: InputDecoration(
                icon: const Icon(
                  Icons.email_rounded,
                  color: Colors.white24,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[800]),
                hintText: "Vorname",
                fillColor: Colors.white70),
          ),
          const SizedBox(
            height: appPadding / 2,
          ),
          TextField(
            textAlign: TextAlign.center,
            controller: lastnameController,
            decoration: InputDecoration(
                icon: const Icon(
                  Icons.email_rounded,
                  color: Colors.white24,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[800]),
                hintText: "Nachname",
                fillColor: Colors.white70),
          ),
          const SizedBox(
            height: appPadding / 2,
          ),
          TextField(
            textAlign: TextAlign.center,
            controller: emailController,
            decoration: InputDecoration(
                icon: const Icon(
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xB444B2C5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                        side: const BorderSide(color: Color(0x815DDFDF)),
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
                      fixedSize: const Size(150, 30),
                      primary: const Color(0xE53EAF8A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(color: Color(0x815DDFDF)),
                      ),
                    ),
                    child: const Text('Registrieren'),
                    onPressed: () async {
                      // ignore: unnecessary_null_comparison
                      if (emailController.text != null &&
                          // ignore: unnecessary_null_comparison
                          passwordController.text != null) {
                        await authService.createUserWithEmailAndPasswort(
                            emailController.text,
                            passwordController.text,
                            firstnameController.text,
                            lastnameController.text,
                            birthdayController.text);
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("""
Sie müssen zuerst eine Email und ein Passwort angeben"""),
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

import 'package:covidapp/covidapp/login/sign_in/signin.dart';
import 'package:covidapp/covidapp/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:covidapp/covidapp/login/constants.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../home.dart';

class Credentials extends StatefulWidget {
  const Credentials({Key? key}) : super(key: key);

  @override
  State<Credentials> createState() => _CredentialsState();
}

class _CredentialsState extends State<Credentials> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();
  String date = "Geburtstag";

  void birthdateListener() {
    date = birthdayController.text;
  }

  @override
  void initState() {
    super.initState();
    birthdayController.addListener(birthdateListener);
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    firstnameController.dispose();
    lastnameController.dispose();
    birthdayController.dispose();
    super.dispose();
  }

  /// Widget build --- Email, Password fields, Reset Passord,Name, Birthday  */

  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(7.0, appPadding, 10.5, appPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: birthdayController,
            textAlign: TextAlign.center,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate:
                    DateTime(DateTime.now().year - 18, DateTime.now().month),
                firstDate: DateTime(1900, 1),
                lastDate: DateTime(DateTime.now().year, DateTime.now().month),
                locale: const Locale('de', 'AT'),
              );
              if (pickedDate != null) {
                String formattedDate =
                    DateFormat('dd.MM.yyyy').format(pickedDate);

                setState(() {
                  birthdayController.text = formattedDate;
                  date = formattedDate;
                });
              }
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
            /*   inputFormatters: [
              FilteringTextInputFormatter.allow(
                RegExp(
                    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                    r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                    r"{0,253}[a-zA-Z0-9])?)*$"),
              ),
            ], */
            textAlign: TextAlign.center,
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            enableSuggestions: false,
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
                        authService.setName(
                            firstnameController.text, lastnameController.text);
                        await authService.createUserWithEmailAndPasswort(
                            emailController.text,
                            passwordController.text,
                            firstnameController.text,
                            lastnameController.text,
                            birthdayController.text);
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).push(PageRouteBuilder(
                            pageBuilder: (_, __, ___) => const Home()));
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

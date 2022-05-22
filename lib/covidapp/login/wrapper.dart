import 'package:covidapp/covidapp/login/sign_in/signin.dart';
import 'package:covidapp/covidapp/models/user_models.dart';
import 'package:covidapp/covidapp/services/auth_service.dart';
import 'package:covidapp/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../intro_screen.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    final uid = authService.id;
    final List introList = [];
    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          if (!introList.contains(uid)) {
            introList.add(uid);
            return OnBoardingPage();
          } else {
            return user == null ? const SignInScreen() : const T2Home();
          }
        } else {
          return const Scaffold(
            body: Center(
              child: SizedBox(
                height: 50.0,
                width: 50.0,
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
      },
    );
  }
}

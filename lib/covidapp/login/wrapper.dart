import 'package:covidapp/covidapp/login/sign_in/signin.dart';
import 'package:covidapp/covidapp/models/user_models.dart';
import 'package:covidapp/covidapp/services/auth_service.dart';
import 'package:covidapp/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
      stream: authService.user,
      builder: (_, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          return user == null ? const SignInScreen() : const T2Home();
        } else {
          return const Scaffold(
            body: Center(
              child: SizedBox(
                child: CircularProgressIndicator(),
                height: 50.0,
                width: 50.0,
              ),
            ),
          );
        }
      },
    );
  }
}

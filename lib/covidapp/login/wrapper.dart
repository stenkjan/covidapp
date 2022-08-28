import 'package:covidapp/covidapp/content/calendar_content.dart';
import 'package:covidapp/covidapp/login/sign_in/signin.dart';
import 'package:covidapp/covidapp/models/user_models.dart';
import 'package:covidapp/covidapp/services/auth_service.dart';
import 'package:covidapp/home.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';

import '../../intro_screen.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final calContent = Provider.of<CalendarContent>(context);
  
    return StreamBuilder<User?>(
        stream: authService.user,
        builder: (_, AsyncSnapshot<User?> snapshot) {
           
          if (snapshot.connectionState == ConnectionState.active) {
            final User? user = snapshot.data;
             calContent.introCheckDB(user?.id);
            
              if (calContent.getintroCheck() == false) {
                
         
                return const OnBoardingPage();
              
            }

            return user == null ? const SignInScreen() : const Home();
          } else {
            return const Scaffold(
              backgroundColor: Colors.black,
              body: Center(
                child: SizedBox(
                  height: 100.0,
                  width: 100.0,
                  child: CircularProgressIndicator(
                      strokeWidth: 8.0, color: Colors.white),
                ),
              ),
            );
          }
        });
  }
}

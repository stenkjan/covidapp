/* import 'dart:async';
import 'package:flutter/material.dart';

import 't2_home.dart';

/// Component UI
class SplashScreenMozido extends StatefulWidget {
  @override
  _SplashScreenMozidoState createState() => _SplashScreenMozidoState();
}

/// Component UI
class _SplashScreenMozidoState extends State<SplashScreenMozido> {
  @override
  void initState() {
    super.initState();
    startTime();

    @override
    void dispose() {
      super.dispose();
    }
  }

  /// Check user
  bool _checkUser = true;

  bool loggedIn = false;

  @override

  /// Setting duration in splash screen
  startTime() async {
    return new Timer(const Duration(milliseconds: 4500), NavigatorPage);
  }

  /// Navigate user if already login or no
  void NavigatorPage() {
    Navigator.of(context).pushReplacement(
        PageRouteBuilder(pageBuilder: (_, __, ___) => T2Home()));
  }

  /// Code Create UI Splash Screen
  @override
  Widget build(BuildContext context) {
    ///
    /// Check connectivity
    ///
    return

        ///
        /// Layout if user connect internet
        ///

        Scaffold(
      backgroundColor: Colors.white,
      //Removed unneccessary container
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: const AssetImage(
                  '''
lib/Screen/FullApps/Mozido/Assets/splashscreen.png''',
                ),
                fit: BoxFit.cover)),
        child: Center(
          child: SingleChildScrollView(
            //Removed Container
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: [
                    Image.asset(
                      "lib/Screen/FullApps/AlliedWallet/Assets/icon_lnc.png",
                      color: Colors.white,
                      height: 29.0,
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    const Text(
                      "Mozido",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w200,
                        fontSize: 36.0,
                        letterSpacing: 1.5,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
 */
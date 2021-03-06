import 'package:flutter/material.dart';
import 'package:covidapp/covidapp/login/constants.dart';

class HeadText extends StatelessWidget {
  const HeadText({Key? key}) : super(key: key);

  @override

  /// Widget build Headtext -- Login  */

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: appPadding,
        vertical: appPadding / 2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.20),
          const Center(
            child: Image(
              image: AssetImage("images/long_covid_logo.png"),
              color: Color(0xE53EAF8A),
              width: 60,
              height: 60,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'LONG COVID APP',
            style: TextStyle(
              decorationThickness: 2.0,
              color: Colors.white24,
              fontSize: 40,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Text(
            'Anmelden',
            style: TextStyle(
              letterSpacing: 2.0,
              color: Colors.white,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

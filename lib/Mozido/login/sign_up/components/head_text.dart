import 'package:flutter/material.dart';
import 'package:covidapp/Mozido/login/constants.dart';

class HeadText extends StatelessWidget {
  const HeadText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: appPadding,
        vertical: appPadding / 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.1),
          const Image(
            image: AssetImage("images/long_covid_logo.png"),
            width: 80,
            height: 40,
          ),
          // SizedBox(height: 5),
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
            'Registrieren',
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

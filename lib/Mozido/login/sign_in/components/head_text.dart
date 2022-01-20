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
        vertical: appPadding / 2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.25),
          const Text(
            'Long Covid App',
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Text(
            'Anmelden',
            style: TextStyle(
              color: Colors.white,
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

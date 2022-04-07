import 'package:flutter/material.dart';
import 'package:covidapp/covidapp/login/constants.dart';

class RectangularButton extends StatelessWidget {
  final String text;
  final VoidCallback press;

  const RectangularButton({Key? key, required this.text, required this.press})
      : super(key: key);

  @override
  /// Widget build Firebase authentification on Button */

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.only(top: appPadding, bottom: appPadding / 2),
        child: Container(
          width: double.infinity,
          height: 65,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    darkPrimary,
                    lightPrimary,
                  ]),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(3, 3),
                  spreadRadius: 1,
                  blurRadius: 4,
                  color: darkShadow,
                ),
                BoxShadow(
                  offset: Offset(-5, -5),
                  spreadRadius: 1,
                  blurRadius: 4,
                  color: lightShadow,
                ),
              ]),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

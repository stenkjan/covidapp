import 'package:flutter/material.dart';
import 'package:covidapp/Mozido/login/constants.dart';

class NeumorphicTextFieldContainer extends StatelessWidget {
  final Widget child;

  const NeumorphicTextFieldContainer({Key? key, required this.child})
      : super(key: key);

  @override
  /** Widget build Firebase authentification on Text Field*/

  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: appPadding / 2),
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                lightPrimary,
                darkPrimary,
              ]),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              offset: Offset(-2, -2),
              spreadRadius: 1,
              blurRadius: 4,
              color: darkShadow,
            ),
            BoxShadow(
              offset: Offset(2, 2),
              spreadRadius: 1,
              blurRadius: 4,
              color: lightShadow,
            ),
          ]),
      child: child,
    );
  }
}

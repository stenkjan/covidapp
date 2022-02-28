import 'package:flutter/material.dart';

class AppColors {
  static Color primaryWhite = const Color(0xFFCADCED);

  static List pieColors = [
    Colors.indigo[400],
    Colors.blue,
    Colors.green,
    Colors.amber,
    const Color.fromARGB(255, 255, 133, 34),
    const Color.fromARGB(255, 116, 9, 2),
    const Color.fromARGB(255, 0, 87, 4),
    const Color.fromARGB(255, 37, 0, 202),
  ];
  static List<BoxShadow> neumorpShadow = [
    BoxShadow(
        color: Colors.white.withOpacity(0.5),
        spreadRadius: -5,
        offset: const Offset(-5, -5),
        blurRadius: 30),
    BoxShadow(
        color: Colors.blue[900]!.withOpacity(0.2),
        spreadRadius: 2,
        offset: const Offset(7, 7),
        blurRadius: 20)
  ];
}

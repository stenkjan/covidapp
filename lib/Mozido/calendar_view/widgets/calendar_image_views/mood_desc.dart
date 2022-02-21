import 'package:flutter/material.dart';

class MoodDesc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Hero(
      tag: "mood",
      child: Center(
        child: Container(
          width: 195,
          height: 269,
          alignment: Alignment.topCenter,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "images/lcs_allgemein.png",
                  ),
                  fit: BoxFit.cover)),
        ),
      ),
    ));
  }
}

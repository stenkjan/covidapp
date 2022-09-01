import 'package:flutter/material.dart';
import 'package:covidapp/covidapp/uebungen/breathing/breathe_widget.dart';
import 'package:covidapp/covidapp/uebungen/breathing/theme_controller.dart';
import 'package:get/get.dart';


/// c as variable for the initialization of colors,textstyle and Settings  -- Widget to breathing homepage*/

class UebungBreathing extends GetView<ThemeController> {
   const UebungBreathing({Key? key}) : super(key: key);
  
   
  @override
  Widget build(BuildContext context) {
    return GetX<ThemeController>(
      
        init: ThemeController(),
        builder: (c) {
          return MaterialApp(
            themeMode: ThemeMode.light,
            theme: ThemeData.light().copyWith(
              elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w300, fontSize: 18))),
              scaffoldBackgroundColor: c.backgroundColor(),
              iconTheme: const IconThemeData(color: Colors.white),
              textTheme: const TextTheme(
                headline1: TextStyle(
                    color: Colors.white,
                    fontFamily: "Sans",
                    fontSize: 33.0,
                    fontWeight: FontWeight.w600),
                headline2: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                    fontFamily: "Sans",
                    fontSize: 28),
                headline4: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontFamily: "Sans",
                    color: Colors.white),
                headline5: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontFamily: "Sans",
                    color: Colors.white),
              ),
              colorScheme:
                  ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
            ),
            debugShowCheckedModeBanner: false,
            home: const BreatheHome(),
          );
        });
  }
}

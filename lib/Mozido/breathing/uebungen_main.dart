import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:covidapp/Mozido/breathing/home_page.dart';
import 'package:covidapp/Mozido/breathing/theme_controller.dart';
import 'package:covidapp/Mozido/breathing/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class uebungbreathing extends GetView<ThemeController> {
  @override
  Widget build(BuildContext context) {
    return GetX<ThemeController>(
        init: ThemeController(),
        builder: (c) {
          return GetMaterialApp(
            themeMode: ThemeMode.light,
            theme: ThemeData.light().copyWith(
              elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w300, fontSize: 23))),
              scaffoldBackgroundColor: c.backgroundColor(),
              iconTheme: const IconThemeData(color: Colors.white),
              textTheme: const TextTheme(
                headline1: TextStyle(color: Colors.white, fontSize: 70),
                headline2: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                    fontSize: 28),
                headline4:
                    TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
                headline5:
                    TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
              ),
              colorScheme:
                  ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
            ),
            debugShowCheckedModeBanner: false,
            home: HomePage(),
          );
        });
  }
}

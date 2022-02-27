import 'package:covidapp/Mozido/breathing/themes.dart';
import 'package:covidapp/Mozido/content/calendar_content.dart';
import 'package:covidapp/Mozido/t2_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'constants.dart';
import 'helpers.dart';

/**Controller for the Theme selection  */

class ThemeController extends GetxController {
  final box = GetStorage();

  late Rx<Color> backgroundColor;
  CalendarContent calContent = CalendarContent();
  @override
  void onInit() {
    backgroundColor = Rx<Color>(backgrounds[backgroundColorFromString(
        box.read(boxBackgroundColor) ?? defaultBackgroundColor.toString())]);
    super.onInit();
  }

  @override
  void onClose() {
    calContent.returnBreatheTrue();
    print(calContent.breatheTrue.toString() + " breathe in theme");
  }
}

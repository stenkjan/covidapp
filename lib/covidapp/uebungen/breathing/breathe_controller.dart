import 'dart:async';

import 'package:covidapp/covidapp/services/exercise_service.dart';
import 'package:covidapp/covidapp/uebungen/breathing/breathe_widget.dart';
import 'package:covidapp/covidapp/uebungen/breathing/constants.dart';
import 'package:covidapp/covidapp/content/strings.dart';
import 'package:covidapp/covidapp/uebungen/breathing/theme_controller.dart';
import 'package:covidapp/covidapp/uebungen/uebungen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wakelock/wakelock.dart';

import '../../../home.dart';
import 'breathe_main.dart';

class BreatheController extends GetxController {
  int initTime = totalTimeSecondsDefault;
  RxInt time = totalTimeSecondsDefault.obs;
  String get timeString =>
      Duration(seconds: time.value).toString().split('.').first.substring(2);

  int initBreathTime = breathTimeMillisecondsDefault;
  RxInt breathTime = breathTimeMillisecondsDefault.obs;

  RxBool breathIn = true.obs;

  late Timer _timer;
  late Timer _breathTimer;

  final box = GetStorage();

  late bool soundOn, hideTimer, hideBreathBar, timerDone;

  ExerciseService exService = ExerciseService();

  @override

  /// on initialization */

  void onInit() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    initTime = box.read(boxTotalTime) ?? totalTimeSecondsDefault;
    time.value = initTime;
    initBreathTime = box.read(boxBreathTime) ?? breathTimeMillisecondsDefault;
    breathTime.value = initBreathTime;
    soundOn = box.read(boxSoundOn) ?? true;
    hideTimer = box.read(boxHideTimer) ?? false;
    hideBreathBar = box.read(boxHideBreathBar) ?? false;
    timerDone = box.read(boxtimerDone) ?? false;
    Wakelock.enable();
    super.onInit();
  }

  @override

  /// when ready the timer starts */

  void onReady() {
    super.onReady();
    startTimer();
  }

  @override

  /// when closed  */

  void onClose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    _timer.cancel();
    _breathTimer.cancel();
    Wakelock.disable();
    //  calContent.returnBreatheTrue();
    Get.delete<BreatheController>();
    calContent.breatheMinL[calContent.currentDate] =
        int.parse(initTime.toString());
    calContent.breatheMin = initTime.toString();
    if (initBreathTime > 0) {
      calContent.returnBreatheTrue();
      calContent.breatheSecL[calContent.currentDate] = initBreathTime;
      calContent.breatheSec = initBreathTime.toString();
    }
    super.onClose();
  }

  /// Timer countdown */

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (time.value > 0) {
        time.value--;
        update();
      } else {
        _timer.cancel();
        onClose();
      }
    });

/** when the timer is not 0 and the breathTime value = the initial Time a sound is played */

    _breathTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      String value = breathTime.value.toString();
      if (time.value != 0 && breathTime.value == 0) {
        breathTime.value = initBreathTime;
        breathIn.value = !breathIn.value;
        if (soundOn) {
          // player.play('sound/sound.mp3');
        }
      }
      if (breathTime.value > 0) {
        breathTime.value -= 100;
        update();
      } else {
        timerDone = true;
        calContent.breatheMinL[calContent.currentDate] =
            int.parse(initTime.toString());
        calContent.breatheMin = initTime.toString();
        if (initBreathTime > 0) {
          calContent.returnBreatheTrue();
          calContent.breatheSecL[calContent.currentDate] = initBreathTime;
          calContent.breatheSec = initBreathTime.toString();
        }

        _breathTimer.cancel();

/** Popup after timer = 0 */
        Get.snackbar(
          'finished',
          '',
          backgroundColor: const Color.fromRGBO(225, 225, 225, 1),
          snackPosition: SnackPosition.BOTTOM,
          isDismissible: true,
          messageText: Container(),
          titleText: Text('Abgeschlossen',
              style:
                  Get.theme.textTheme.headline5!.copyWith(color: Colors.black)),
        );
      }
      if (_breathTimer.isActive == false) {
        timerDone = true;
      }
    });
  }
}

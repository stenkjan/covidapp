import 'package:covidapp/covidapp/uebungen/breathing/breathe_main.dart';
import 'package:covidapp/covidapp/uebungen/breathing/rive_speed_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'package:flutter/services.dart';
import '../../content/calendar_content.dart';
import '../../services/exercise_service.dart';
import '../uebungen.dart';
import 'breathe_controller.dart';

/// Parameters are imported from the Breathecontroller / Widget is build  */

class BreathePage extends GetView<BreatheController> {
  const BreathePage({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    CalendarContent calContent = Provider.of<CalendarContent>(context);
    ExerciseService exService = Provider.of<ExerciseService>(context);
    /*  exService.dailyBreatheExercise(
        calContent.breatheMin, calContent.breatheSec); */
    if (calContent.returnBreatheMin() == 0) {
      calContent.returnbreatheFalse();
    }

    void navigateOnClosed(bool breathDone) async {
      await Future.delayed(const Duration(milliseconds: 1000));
      if (calContent.breatheTrue) {
        Navigator.of(context).push(
            PageRouteBuilder(pageBuilder: (_, __, ___) => (const Uebungen())));

        const SnackBar(content: Text("Abgeschlossen"));
      }
    }

    return Scaffold(
      appBar: AppBar(
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
          backgroundColor: const Color(0xFF313237),
          centerTitle: true,
          title: const Text(
            "Atemübung",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Sans",
                fontSize: 17.0,
                fontWeight: FontWeight.w600),
          )),
      body: GetX<BreatheController>(
          init: BreatheController(),
          builder: (c) {
            /*  if (c.timerDone) {
              Future.delayed(Duration.zero, () {
                Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (_, __, ___) => (const Uebungen())));
              });
            } */
            if (c.timerDone) {
              navigateOnClosed(calContent.breatheTrue);
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                ),
                if (!c.hideTimer) ...[
                  Text(
                    c.timeString,
                    style: Theme.of(context).textTheme.headline4,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 50),
                ],

                /* if (c.timerDone) ...[
                  Center(
                    child: SizedBox(
                      width: 180,
                      height: 35,
                      child: Neumorphic(
                        style: NeumorphicStyle(
                            shape: NeumorphicShape.concave,
                            boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.circular(12)),
                            depth: 15,
                            intensity: 3.0,
                            shadowLightColor: Colors.transparent,
                            /*  lightSource: LightSource.topLeft, */
                            color: const Color.fromARGB(255, 1, 25, 32)),
                        child: ElevatedButton.icon(
                            icon: const Icon(Icons.arrow_back_sharp),
                            style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 18),
                            ),
                            label: const Text("Beenden"),
                            onPressed:
                                () => /* Navigator.of(context).push(
                              PageRouteBuilder(
                                  pageBuilder: (_, __, ___) =>
                                      (UebungBreathing()))), */

                                    Navigator.pop(context)),
                      ),
                    ),
                  ),
                ], */
                CircularPercentIndicator(
                  radius: 180,
                  lineWidth: 16,
                  backgroundColor: Colors.black12,
                  progressColor: Color.fromARGB(223, 2, 97, 175),
                  circularStrokeCap: CircularStrokeCap.round,
                  animateFromLastPercent: true,
                  animation: true,
                  animationDuration: 1000,
                  percent: c.time / c.initTime,
                  center: Padding(
                    padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
                    child: RiveAnimation.asset(
                      'images/lung.riv',
                      controllers: [
                        SpeedController('breathe',
                            speedMultiplier: 1 / (c.initBreathTime / 1000))
                      ],
                    ),
                  ),
                ),

                /**Progress animation with c as Variable for initialization */

                if (!c.hideBreathBar) ...[
                  const SizedBox(height: 50),
                  LinearPercentIndicator(
                    percent: c.breathIn.value
                        ? 1 - c.breathTime / c.initBreathTime
                        : c.breathTime / c.initBreathTime,
                    backgroundColor: Colors.black12,
                    progressColor: const Color.fromRGBO(225, 225, 225, 1),
                    lineHeight: 12,
                    width: 200,
                    animateFromLastPercent: true,
                    animation: true,
                    animationDuration: 100,
                    alignment: MainAxisAlignment.center,
                    barRadius: const Radius.circular(10.0),
                  ),
                ],
                const SizedBox(height: 5),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    c.breathIn.value ? 'Einatmen' : 'Ausatmen',
                    style: Theme.of(context).textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            );
          }),
    );
  }
}

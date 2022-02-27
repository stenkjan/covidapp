import 'package:covidapp/Mozido/breathing/rive_speed_controller.dart';
import 'package:covidapp/Mozido/breathing/settings_page.dart';
import 'package:covidapp/Mozido/content/calendar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'breathe_controller.dart';
import 'dart:async';

class BreathePage extends GetView<BreatheController> {
   
   
  @override
  Widget build(BuildContext context) {
   

  
    return Scaffold(
      appBar: AppBar(
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
          backgroundColor: const Color(0xFF029CF5),
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
                  CircularPercentIndicator(
                    radius: 280,
                    lineWidth: 16,
                    backgroundColor: Colors.black12,
                    progressColor: Colors.white,
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
                      linearStrokeCap: LinearStrokeCap.roundAll,
                    ),
                  ],
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      c.breathIn.value ? 'Einatmen' : 'Ausatmen',
                      style: Theme.of(context).textTheme.headline5,
                      textAlign: TextAlign.center,
                    ),
                  ),
               
                    
                ]);
          }),
    );
  }
}

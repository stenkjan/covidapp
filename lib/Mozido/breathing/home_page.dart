import 'package:covidapp/Mozido/Uebungen_webview.dart';
import 'package:covidapp/Mozido/breathing/breathe_page.dart';
import 'package:covidapp/Mozido/breathing/settings_page.dart';
import 'package:covidapp/Mozido/breathing/rive_speed_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:flutter/services.dart';

import 'home_controller.dart';

/** Homepage-- Widget build */

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "",
            style: TextStyle(
                color: Colors.white, fontFamily: "Popins", fontSize: 18.0),
          ),
          centerTitle: true,
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
          backgroundColor: Color(0xFF313237),
          iconTheme: const IconThemeData(color: Color(0xFF029CF5))),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
          ),
          Text(
            'Atemübung',
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          ),
          IconButton(
              onPressed: () {
                /**Navigation to Settings */
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              },
              icon: const Icon(Icons.settings)),
          Text(
            'Weitere Übungen sind auf der Website zu finden',
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
          IconButton(
              onPressed: () {
                /**navigation to Webview */
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Webview()));
              },
              icon: const Icon(Icons.web)),
          const SizedBox(height: 30),
          Container(
            height: 280,
            width: 280,
            padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
            child: RiveAnimation.asset(
              'images/lung.riv',
              controllers: [
                SpeedController('breathe', speedMultiplier: 1 / 5.5)
              ],
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: 130,
            child: ElevatedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('START'),
                  Icon(
                    Icons.play_arrow_rounded,
                  )
                ],
              ),
              onPressed: () {
                /** Navigation to Breathe Page */
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BreathePage()));
              },
            ),
          )
        ],
      ),
    );
  }
}

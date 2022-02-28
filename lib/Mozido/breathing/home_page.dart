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
            "Start",
            style: TextStyle(
                color: Colors.white, fontFamily: "Popins", fontSize: 18.0),
          ),
          centerTitle: true,
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
          backgroundColor: const Color(0xFF313237),
          iconTheme: const IconThemeData(color: Colors.blue)),
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
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(75, 50),
                primary: const Color(0xFF313237),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: const BorderSide(color: Colors.white),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('START',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold)),
                  Icon(
                    Icons.play_arrow_rounded,
                    size: 35,
                    color: Color(0xB444B2C5),
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

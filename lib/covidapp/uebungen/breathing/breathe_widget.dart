import 'package:covidapp/covidapp/uebungen/breathing/breathe_graph.dart';
import 'package:covidapp/covidapp/uebungen/uebungen.dart';
import 'package:covidapp/covidapp/uebungen/uebungen_webview.dart';
import 'package:covidapp/covidapp/uebungen/breathing/breathe_page.dart';
import 'package:covidapp/covidapp/uebungen/breathing/settings_page.dart';
import 'package:covidapp/covidapp/uebungen/breathing/rive_speed_controller.dart';
import 'package:covidapp/covidapp/webview/main_web_view.dart';
import 'package:covidapp/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

import '../../content/calendar_content.dart';
import '../../services/exercise_service.dart';
import '../exercise_data.dart';
import 'home_controller.dart';

/// Homepage-- Widget build */

class BreatheHome extends GetView<HomeController> {
  const BreatheHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        title: const Text(
          "Start",
          style: TextStyle(
              color: Colors.white, fontFamily: "Popins", fontSize: 18.0),
        ),
        centerTitle: true,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
        backgroundColor: const Color(0xFF313237),
        iconTheme: const IconThemeData(color: Colors.blue),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).push(PageRouteBuilder(
                pageBuilder: (_, __, ___) => const Uebungen()));
          },
        ),
      ), */
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
                /* Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsPage())); */
                Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const SettingsPage()));
                //Get.to(() => const SettingsPage());
              },
              icon: const Icon(Icons.settings)),
          Text(
            'Weitere Übungen sind auf den Webseiten zu finden',
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const WebMain()));
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 100,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(75, 50),
                      primary: const Color(0xFF313237),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        side: const BorderSide(color: Colors.white),
                      ),
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      size: 35,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const Home()));
                      /* Get.offAll(() => const T2Home());
                      Get.deleteAll(); */
                    }),
              ),
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
                    //Get.to(const BreathePage());
                    Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (_, __, ___) => const BreathePage()));
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Center(
            child: SizedBox(
              width: 150,
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
                    Text('Statistik',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold)),
                    Icon(
                      Icons.graphic_eq,
                      size: 35,
                      color: Color(0xB444B2C5),
                    ),
                  ],
                ),
                onPressed: () => showDialog(
                    context: context,
                    builder: (context) {
                      return Stack(
                        children: [
                          AlertDialog(
                              backgroundColor:
                                  const Color.fromARGB(202, 0, 0, 0),
                              content: Stack(
                                children: [
                                  Visibility(
                                      visible: false,
                                      child: ExerciseData('breathemin')),
                                  Visibility(
                                      visible: false,
                                      child: ExerciseData('breathesec')),
                                  Container(
                                      alignment: Alignment.topCenter,
                                      child: const BreatheGraph()),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  child: const Text("Schließen"),
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ]),
                        ],
                      );
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:covidapp/Mozido/breathing/breathe_page.dart';
import 'package:covidapp/Mozido/breathing/settings_page.dart';
import 'package:covidapp/Mozido/breathing/rive_speed_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:flutter/services.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
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
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Color(0xFF313237),
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.lightBlue),
      ),
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              },
              icon: const Icon(Icons.settings)),
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

import 'package:covidapp/covidapp/content/calendar_content.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

import '../../../covidapp/uebungen/Puls_Messung/chart.dart';
import '../../../covidapp/uebungen/Puls_Messung/heart_bpm.dart';

class Puls_Analyse extends StatefulWidget {
  const Puls_Analyse({required Key key}) : super(key: key);

  @override
  Puls_AnalyseState createState() => Puls_AnalyseState();
}

class Puls_AnalyseState extends State<Puls_Analyse> {
  List<SensorValue> data = [];
  List<SensorValue> bpmValues = [];

  bool isBPMEnabled = false;
  bool isvisible = true;
  Widget? dialog;
  late double imageSize;

  @override
  initState() {
    imageSize = 400;
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CalendarContent calContent = Provider.of<CalendarContent>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 49, 50, 55),

      ///
      /// Appbar
      ///
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
        backgroundColor: const Color(0xFF313237),
        centerTitle: true,
        title: const Text(
          "Puls Analyse",
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Sans",
              fontSize: 17.0,
              fontWeight: FontWeight.w600),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0.0,
      ),

      body: Column(
        children: [
          isBPMEnabled
              ? dialog = HeartBPMDialog(
                  context: context,
                  onRawData: (value) {
                    setState(() {
                      if (data.length >= 100) data.removeAt(0);
                      data.add(value);
                    });
                  },
                  onBPM: (value) => setState(() {
                    print(" on bpm" + calContent.pulseTrue.toString());
                    calContent.returnPulseTrue();
                    if (bpmValues.length >= 100) bpmValues.removeAt(0);
                    bpmValues.add(SensorValue(
                        value: value.toDouble(), time: DateTime.now()));
                    calContent.bpmday.add(value);
                    Visibility(
                        visible: false, child: calContent.getpulseTrue());
                  }),
                 
                )
              : const SizedBox(
                  height: 20,
                ),
          isBPMEnabled && data.isNotEmpty
              ? Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                      width: 5,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(
                          5.0,
                          5.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                  ),
                  height: 180,
                  child: BPMChart(data),
                )
              : const SizedBox(),
          const SizedBox(
            height: 10,
          ),
          isBPMEnabled && bpmValues.isNotEmpty
              ? Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.lightBlue,
                      width: 5,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(
                          5.0,
                          5.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                  ),
                  constraints: const BoxConstraints.expand(height: 180),
                  child: BPMChart(bpmValues),
                )
              : const SizedBox(
                  height: 10,
                ),
          Center(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.favorite_rounded),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                textStyle:
                    const TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
              ),
              label:
                  Text(isBPMEnabled ? "Messung Anhalten" : "Puls Pro Minute"),
              onPressed: () => setState(() {
                imageSize = 20;
                if (isBPMEnabled) {
                  isBPMEnabled = false;
                  isvisible = false;
                  Navigator.pop(context);
                } else {
                  isBPMEnabled = true;
                }
              }),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              height: imageSize,
              width: imageSize,
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
              child: const RiveAnimation.asset(
                'images/heartfinal.riv',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

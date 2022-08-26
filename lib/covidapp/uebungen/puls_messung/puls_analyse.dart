import 'dart:convert';

import 'package:covidapp/covidapp/content/calendar_content.dart';
import 'package:covidapp/covidapp/services/exercise_service.dart';
import 'package:covidapp/covidapp/uebungen/puls_messung/pulse_graph.dart';

import 'package:collection/collection.dart';

import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';

import '../../../covidapp/uebungen/Puls_Messung/chart.dart';
import '../../../covidapp/uebungen/Puls_Messung/heart_bpm.dart';
import '../exercise_data.dart';

class PulsAnalyse extends StatefulWidget {
  const PulsAnalyse({Key? key}) : super(key: key);

  @override
  PulsAnalyseState createState() => PulsAnalyseState();
}

class PulsAnalyseState extends State<PulsAnalyse> {
  List<SensorValue> data = [];
  List<SensorValue> bpmValues = [];

  bool isBPMEnabled = false;
  bool isvisible = true;
  Widget? dialog;
  late double imageSize;
  num bpmValue = 0;
  static bool showInformation = false;
  @override
  void initState() {
    imageSize = 400;
    showInformation = false;
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CalendarContent calContent = Provider.of<CalendarContent>(context);
    ExerciseService exService = Provider.of<ExerciseService>(context);
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

      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ExerciseData('pulse'),
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
                      // ignore: avoid_print
                      print(" on bpm${calContent.pulseTrue}");
                      calContent.returnPulseTrue();
                      if (bpmValues.length >= 100) bpmValues.removeAt(0);
                      bpmValues.add(SensorValue(
                          value: value.toDouble(), time: DateTime.now()));

                      bpmValue = bpmValues
                              .map((m) => m.value)
                              .reduce((a, b) => a + b) /
                          bpmValues.length;

                      print("§value : bpm value added");
                      print("§bpmValue : bpmValue added");
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
                        color: const Color.fromARGB(181, 177, 3, 3),
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
                      color: Colors.grey,
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
                        color: const Color.fromARGB(181, 177, 3, 3),
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
                      color: Colors.grey,
                    ),
                    constraints: const BoxConstraints.expand(height: 180),
                    child: BPMChart(bpmValues),
                  )
                : const SizedBox(
                    height: 5,
                  ),
            Stack(
              children: [
                Center(
                  child: Neumorphic(
                    margin: const EdgeInsets.all(20),
                    curve: Curves.easeIn,
                    style: NeumorphicStyle(
                        shape: NeumorphicShape.convex,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(50)),
                        depth: 5,
                        intensity: 2.0,
                        shadowLightColor: const Color.fromARGB(108, 0, 0, 0),
                        lightSource: LightSource.topLeft,
                        color: const Color.fromARGB(255, 46, 155, 244)),
                    child: SizedBox(
                      width: 220,
                      height: 35,
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.favorite_rounded),
                        style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 18),
                        ),
                        label: Text(isBPMEnabled
                            ? "Messung Anhalten"
                            : "Puls Pro Minute"),
                        onPressed: () => setState(() {
                          imageSize = 20;
                          if (isBPMEnabled) {
                            isBPMEnabled = false;
                            isvisible = false;

                            Navigator.of(context).push(
                              PageRouteBuilder(
                                  pageBuilder: (_, __, ___) =>
                                      const PulsAnalyse()),
                            );
                          } else {
                            isBPMEnabled = true;
                          }
                          if (calContent.returnbpmDay().length > 7) {
                            calContent.returnbpmDay().removeAt(1);
                          }

                          if (calContent
                                  .returnbpmDay()[calContent.currentDate] !=
                              bpmValue.toDouble()) {
                            calContent.addbpmDay(bpmValue.toDouble());
                            exService.dailyPulseExercise(
                                bpmValue.toDouble().round());
                          }
                        }),
                      ),
                    ),
                  ),
                ),
                Visibility(
                    visible: calContent.pulseTrue,
                    child: Center(
                      child: Text(
                        bpmValue.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 312.0, top: 13),
                  child: TextButton(
                      onPressed: () => showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                backgroundColor: Colors.black12,
                                title: const Text("Anleitung"),
                                content: Builder(
                                  builder: (context) {
                                    // Get available height and width of the build area of this widget. Make a choice depending on the size.
                                    var height =
                                        MediaQuery.of(context).size.height;
                                    var width =
                                        MediaQuery.of(context).size.width;
                                    return SizedBox(
                                      height: height - 10,
                                      width: width - 10,
                                      child: Column(
                                        children: [
                                          Container(
                                            width: 300,
                                            height: 100,
                                            alignment: Alignment.center,
                                            decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0)),
                                                color: Color(0xFF363940),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 10.0,
                                                    spreadRadius: 2.0,
                                                  ),
                                                ],
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                      "images/pulse_helper.jpg",
                                                    ),
                                                    fit: BoxFit.cover)),
                                          ),
                                          const Expanded(
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.vertical,
                                              child: SizedBox(
                                                width: 350,
                                                height: 250,
                                                child: Text(
                                                    """In der Pulsanalyse können Sie Ihren Puls täglich messen - dafür gehen Sie auf "Puls pro Minute" und aktivieren dann den Zugriff auf Ihre Kamera durch die App. Danach legen sie den Finger auf die Kamera und halten ihn still. Im Idealfall ist der Finger so auf der Linse des Smartphones, dass Veränderungen im Blutfluss fast mit bloßem Auge sichtbar sind.""",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                    )),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 200,
                                            height: 120,
                                            alignment: Alignment.center,
                                            decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0)),
                                                color: Color(0xFF363940),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 10.0,
                                                    spreadRadius: 2.0,
                                                  ),
                                                ],
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                    "images/pulse_helper_2.png",
                                                  ),
                                                  fit: BoxFit.cover,
                                                )),
                                          ),
                                          const Expanded(
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.vertical,
                                              child: SizedBox(
                                                width: 350,
                                                height: 250,
                                                child: Text(
                                                    """Der obere Graph zeigt die rohe Herzrate, der untere Graph die geglätteten Werte. Die Zahl über den Graphen gibt den aktuellen Pulswert an. Zum Abschluss der Übung wählen sie "Messung anhalten".""",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                    )),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                actions: [
                                  Stack(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                          left: 10,
                                          top: 3,
                                        ),
                                        alignment: Alignment.bottomRight,
                                        child: TextButton(
                                          child: const Text(
                                            "Verstanden",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontFamily: "sans",
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          onPressed: () =>
                                              Navigator.pop(context),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                      child: const Icon(
                        Icons.info,
                        size: 30,
                        color: Color.fromARGB(255, 165, 165, 165),
                      )),
                ),
              ],
            ),
            Flexible(
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
            Padding(
              padding: const EdgeInsets.only(
                bottom: 35,
              ),
              child: Neumorphic(
                margin: const EdgeInsets.all(20),
                curve: Curves.easeIn,
                style: NeumorphicStyle(
                    shape: NeumorphicShape.convex,
                    boxShape:
                        NeumorphicBoxShape.roundRect(BorderRadius.circular(50)),
                    depth: 5,
                    intensity: 2.0,
                    shadowLightColor: const Color.fromARGB(108, 0, 0, 0),
                    lightSource: LightSource.topLeft,
                    color: const Color.fromARGB(255, 46, 155, 244)),
                child: SizedBox(
                  width: 180,
                  height: 35,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.graphic_eq),
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w300, fontSize: 18),
                    ),
                    label: const Text("Statistik"),
                    onPressed: () => showDialog(
                        context: context,
                        builder: (context) {
                          return Stack(
                            children: [
                              AlertDialog(
                                  backgroundColor:
                                      const Color.fromARGB(202, 0, 0, 0),
                                  title: const Text(""),
                                  content: Stack(
                                    children: [
                                      Opacity(
                                          opacity: 0.5,
                                          child: ExerciseData('pulse')),
                                      const PulseGraph(),
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
            ),
          ],
        ),
      ),
    );
  }
}

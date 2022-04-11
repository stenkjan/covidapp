import 'package:covidapp/covidapp/calendar_view/widgets/colors.dart';
import 'package:covidapp/covidapp/content/calendar_content.dart';
import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';

import '../../content/strings.dart';
import '../../content/variable_colors.dart';

class HeartGraph extends StatefulWidget {
  const HeartGraph({Key? key}) : super(key: key);

  @override
  HeartGraphState createState() => HeartGraphState();
}

class HeartGraphState extends State<HeartGraph> {
  late List<Feature> features;
  late CalendarContent calContent;
  @override
  void initState() {
    calContent = CalendarContent();
    calContent.bpmWeekL();
    features = [
      Feature(
        title: headline[4]['tag'],
        color: AppColors.pieColors[3],
        data: [
          calContent.herzL[calContent.listIndex].toDouble() / 10,
          calContent.herzL[calContent.listIndex + 1].toDouble() / 10,
          calContent.herzL[calContent.listIndex + 2].toDouble() / 10,
          calContent.herzL[calContent.listIndex + 3].toDouble() / 10,
          calContent.herzL[calContent.listIndex + 4].toDouble() / 10,
          calContent.herzL[calContent.listIndex + 5].toDouble() / 10
        ],
      ),
      Feature(
        title: "BPM",
        color: AppColors.pieColors[5],
        data: [
          calContent.bpm[calContent.listIndex].toDouble() * 70 / 1000,
          calContent.bpm[calContent.listIndex + 1].toDouble() * 70 / 1000,
          calContent.bpm[calContent.listIndex + 2].toDouble() * 70 / 1000,
          calContent.bpm[calContent.listIndex + 3].toDouble() * 70 / 1000,
          calContent.bpm[calContent.listIndex + 4].toDouble() * 70 / 1000,
          calContent.bpm[calContent.listIndex + 5].toDouble() * 70 / 1000,
        ],
      ),
    ];
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.topRight,
          child: TextButton(
              onPressed: () => showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                          backgroundColor: Colors.black12,
                          title: const Text(""),
                          content: const Text(
                              "Die Grafik zeigt einen Vergleich zwischen Herz/-Kreislaufproblemen und der durch die Übung Puls Analyse gemessenen Herzrate (vergangene 7 Tage ab Auswahldatum).",
                              style: TextStyle(
                                color: Colors.white,
                              )),
                          actions: [
                            TextButton(
                              child: const Text("Verstanden"),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ])),
              child: const Icon(
                Icons.info,
                color: Colors.white,
              )),
        ),
        Container(
          alignment: Alignment.center,
          height: 300,
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              /*   Padding(
                padding: const EdgeInsets.symmetric(vertical: 64.0),
                child: Text(
                  "Woche",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ), */
              const SizedBox(
                height: 30,
              ),
              LineGraph(
                features: features,
                size: const Size(350, 250),
                labelX: [
                  calContent.dateL[calContent.listIndex].toString(),
                  calContent.dateL[calContent.listIndex + 1].toString(),
                  calContent.dateL[calContent.listIndex + 2].toString(),
                  calContent.dateL[calContent.listIndex + 3].toString(),
                  calContent.dateL[calContent.listIndex + 4].toString(),
                  calContent.dateL[calContent.listIndex + 5].toString()
                ],
                labelY: const ['20%', '40%', '60%', '80%', '100%'],
                showDescription: true,
                graphColor: Colors.white54,
                descriptionHeight: 40,
              ),
              const SizedBox(
                height: 0,
              )
            ],
          ),
        ),
      ],
    );
  }
}

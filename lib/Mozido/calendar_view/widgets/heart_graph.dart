import 'package:covidapp/Mozido/content/calendar_content.dart';
import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';

import '../../content/strings.dart';

class HeartGraph extends StatefulWidget {
  @override
  _HeartGraphState createState() => _HeartGraphState();
}

class _HeartGraphState extends State<HeartGraph> {
  late List<Feature> features;
  late CalendarContent calContent;
  @override
  void initState() {
    calContent = CalendarContent();
    calContent.bpmWeekL();
    features = [
      Feature(
        title: headline[0]['tag'],
        color: Colors.blue,
        data: [
          calContent.herzL[0].toDouble() * 10,
          calContent.herzL[1].toDouble() * 10,
          calContent.herzL[2].toDouble() * 10,
          calContent.herzL[3].toDouble() * 10,
          calContent.herzL[4].toDouble() * 10,
          calContent.herzL[5].toDouble() * 10
        ],
      ),
      Feature(
        title: headline[1]['tag'],
        color: Colors.blue,
        data: [
          calContent.bpm[0].toDouble(),
          calContent.bpm[1].toDouble(),
          calContent.bpm[2].toDouble(),
          calContent.bpm[3].toDouble(),
          calContent.bpm[4].toDouble(),
          calContent.bpm[5].toDouble()
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
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
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
          LineGraph(
            features: features,
            size: Size(420, 450),
            labelX: [
              calContent.dateL[0].toString(),
              calContent.dateL[0].toString(),
              calContent.dateL[0].toString(),
              calContent.dateL[0].toString(),
              calContent.dateL[0].toString(),
              calContent.dateL[0].toString()
            ],
            labelY: const ['20', '40', '60', '80', '100'],
            showDescription: true,
            graphColor: Colors.black87,
          ),
          SizedBox(
            height: 0,
          )
        ],
      ),
    );
  }
}

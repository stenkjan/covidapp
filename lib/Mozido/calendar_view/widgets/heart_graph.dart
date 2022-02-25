import 'package:covidapp/Mozido/content/calendar_content.dart';
import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';

import '../../content/strings.dart';
import '../../content/variable_colors.dart';

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
        title: headline[4]['tag'],
        color: variableColors[4],
        data: [
          calContent.herzL[0].toDouble() / 10,
          calContent.herzL[1].toDouble() / 10,
          calContent.herzL[2].toDouble() / 10,
          calContent.herzL[3].toDouble() / 10,
          calContent.herzL[4].toDouble() / 10,
          calContent.herzL[5].toDouble() / 10
        ],
      ),
      Feature(
        title: "BPM",
        color: variableColors[5],
        data: [
          calContent.bpm[0].toDouble() / 100,
          calContent.bpm[1].toDouble() / 100,
          calContent.bpm[2].toDouble() / 100,
          calContent.bpm[3].toDouble() / 100,
          calContent.bpm[4].toDouble() / 100,
          calContent.bpm[5].toDouble() / 100,
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
    return Container(
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
          SizedBox(
            height: 30,
          ),
          LineGraph(
            features: features,
            size: Size(350, 250),
            labelX: [
              calContent.dateL[0].toString(),
              calContent.dateL[1].toString(),
              calContent.dateL[2].toString(),
              calContent.dateL[3].toString(),
              calContent.dateL[4].toString(),
              calContent.dateL[5].toString()
            ],
            labelY: const ['20%', '40%', '60%', '80%', '100%'],
            showDescription: true,
            graphColor: Colors.blueGrey,
            descriptionHeight: 40,
          ),
          SizedBox(
            height: 0,
          )
        ],
      ),
    );
  }
}

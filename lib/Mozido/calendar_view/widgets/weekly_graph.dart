import 'package:covidapp/Mozido/content/calendar_content.dart';
import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';

import '../../content/strings.dart';

class WeekGraph extends StatefulWidget {
  @override
  _WeekGraphState createState() => _WeekGraphState();
}

class _WeekGraphState extends State<WeekGraph> {
  late List<Feature> features;
  late CalendarContent calContent;
  @override
  void initState() {
    calContent = CalendarContent();
    features = [
      Feature(
        title: headline[0]['tag'],
        color: Colors.blue,
        data: [
          calContent.moodL[0].toDouble(),
          calContent.moodL[1].toDouble(),
          calContent.moodL[2].toDouble(),
          calContent.moodL[3].toDouble(),
          calContent.moodL[4].toDouble(),
          calContent.moodL[5].toDouble()
        ],
      ),
      Feature(
        title: headline[1]['tag'],
        color: Colors.blue,
        data: [
          calContent.muedigkeitL[0].toDouble(),
          calContent.muedigkeitL[1].toDouble(),
          calContent.muedigkeitL[2].toDouble(),
          calContent.muedigkeitL[3].toDouble(),
          calContent.muedigkeitL[4].toDouble(),
          calContent.muedigkeitL[5].toDouble()
        ],
      ),
      Feature(
        title: headline[2]['tag'],
        color: Colors.black,
        data: [
          calContent.atemnotL[0].toDouble(),
          calContent.atemnotL[1].toDouble(),
          calContent.atemnotL[2].toDouble(),
          calContent.atemnotL[3].toDouble(),
          calContent.atemnotL[4].toDouble(),
          calContent.atemnotL[5].toDouble()
        ],
      ),
      Feature(
        title: headline[3]['tag'],
        color: Colors.orange,
        data: [
          calContent.sinneL[0].toDouble(),
          calContent.sinneL[1].toDouble(),
          calContent.sinneL[2].toDouble(),
          calContent.sinneL[3].toDouble(),
          calContent.sinneL[4].toDouble(),
          calContent.sinneL[5].toDouble()
        ],
      ),
      Feature(
        title: headline[4]['tag'],
        color: Colors.red,
        data: [
          calContent.herzL[0].toDouble(),
          calContent.herzL[1].toDouble(),
          calContent.herzL[2].toDouble(),
          calContent.herzL[3].toDouble(),
          calContent.herzL[4].toDouble(),
          calContent.herzL[5].toDouble()
        ],
      ),
      Feature(
        title: headline[5]['tag'],
        color: Colors.green,
        data: [
          calContent.schlafL[0].toDouble(),
          calContent.schlafL[1].toDouble(),
          calContent.schlafL[2].toDouble(),
          calContent.schlafL[3].toDouble(),
          calContent.schlafL[4].toDouble(),
          calContent.schlafL[5].toDouble()
        ],
      ),
      Feature(
        title: headline[6]['tag'],
        color: Colors.green,
        data: [
          calContent.nervenL[0].toDouble(),
          calContent.nervenL[1].toDouble(),
          calContent.nervenL[2].toDouble(),
          calContent.nervenL[3].toDouble(),
          calContent.nervenL[4].toDouble(),
          calContent.nervenL[5].toDouble()
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
            labelY: const ['2', '4', '6', '8', '10'],
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

import 'package:covidapp/Mozido/content/calendar_content.dart';
import 'package:covidapp/Mozido/content/variable_colors.dart';
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
        color: variableColors[0],
        data: [
          calContent.moodL[0].toDouble() / 10,
          calContent.moodL[1].toDouble() / 10,
          calContent.moodL[2].toDouble() / 10,
          calContent.moodL[3].toDouble() / 10,
          calContent.moodL[4].toDouble() / 10,
          calContent.moodL[5].toDouble() / 10
        ],
      ),
      Feature(
        title: headline[1]['tag'],
        color: variableColors[1],
        data: [
          calContent.muedigkeitL[0].toDouble() / 10,
          calContent.muedigkeitL[1].toDouble() / 10,
          calContent.muedigkeitL[2].toDouble() / 10,
          calContent.muedigkeitL[3].toDouble() / 10,
          calContent.muedigkeitL[4].toDouble() / 10,
          calContent.muedigkeitL[5].toDouble() / 10
        ],
      ),
      Feature(
        title: headline[2]['tag'],
        color: variableColors[2],
        data: [
          calContent.atemnotL[0].toDouble() / 10,
          calContent.atemnotL[1].toDouble() / 10,
          calContent.atemnotL[2].toDouble() / 10,
          calContent.atemnotL[3].toDouble() / 10,
          calContent.atemnotL[4].toDouble() / 10,
          calContent.atemnotL[5].toDouble() / 10
        ],
      ),
      Feature(
        title: headline[3]['tag'],
        color: variableColors[3],
        data: [
          calContent.sinneL[0].toDouble() / 10,
          calContent.sinneL[1].toDouble() / 10,
          calContent.sinneL[2].toDouble() / 10,
          calContent.sinneL[3].toDouble() / 10,
          calContent.sinneL[4].toDouble() / 10,
          calContent.sinneL[5].toDouble() / 10
        ],
      ),
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
        title: headline[5]['tag'],
        color: variableColors[5],
        data: [
          calContent.schlafL[0].toDouble() / 10,
          calContent.schlafL[1].toDouble() / 10,
          calContent.schlafL[2].toDouble() / 10,
          calContent.schlafL[3].toDouble() / 10,
          calContent.schlafL[4].toDouble() / 10,
          calContent.schlafL[5].toDouble() / 10
        ],
      ),
      Feature(
        title: headline[6]['tag'],
        color: variableColors[6],
        data: [
          calContent.nervenL[0].toDouble() / 10,
          calContent.nervenL[1].toDouble() / 10,
          calContent.nervenL[2].toDouble() / 10,
          calContent.nervenL[3].toDouble() / 10,
          calContent.nervenL[4].toDouble() / 10,
          calContent.nervenL[5].toDouble() / 10
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
            height: 5,
          ),
          LineGraph(
            features: features,
            size: const Size(350, 250),
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
            graphColor: Colors.white,
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

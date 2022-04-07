import 'package:covidapp/covidapp/content/calendar_content.dart';
import 'package:covidapp/covidapp/content/variable_colors.dart';
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
          calContent.moodL[calContent.listIndex].toDouble() / 10,
          calContent.moodL[calContent.listIndex + 1].toDouble() / 10,
          calContent.moodL[calContent.listIndex + 2].toDouble() / 10,
          calContent.moodL[calContent.listIndex + 3].toDouble() / 10,
          calContent.moodL[calContent.listIndex + 4].toDouble() / 10,
          calContent.moodL[calContent.listIndex + 5].toDouble() / 10
        ],
      ),
      Feature(
        title: headline[1]['tag'],
        color: variableColors[1],
        data: [
          calContent.muedigkeitL[calContent.listIndex].toDouble() / 10,
          calContent.muedigkeitL[calContent.listIndex + 1].toDouble() / 10,
          calContent.muedigkeitL[calContent.listIndex + 2].toDouble() / 10,
          calContent.muedigkeitL[calContent.listIndex + 3].toDouble() / 10,
          calContent.muedigkeitL[calContent.listIndex + 4].toDouble() / 10,
          calContent.muedigkeitL[calContent.listIndex + 5].toDouble() / 10
        ],
      ),
      Feature(
        title: headline[2]['tag'],
        color: variableColors[2],
        data: [
          calContent.atemnotL[calContent.listIndex].toDouble() / 10,
          calContent.atemnotL[calContent.listIndex + 1].toDouble() / 10,
          calContent.atemnotL[calContent.listIndex + 2].toDouble() / 10,
          calContent.atemnotL[calContent.listIndex + 3].toDouble() / 10,
          calContent.atemnotL[calContent.listIndex + 4].toDouble() / 10,
          calContent.atemnotL[calContent.listIndex + 5].toDouble() / 10
        ],
      ),
      Feature(
        title: headline[3]['tag'],
        color: variableColors[3],
        data: [
          calContent.sinneL[calContent.listIndex].toDouble() / 10,
          calContent.sinneL[calContent.listIndex + 1].toDouble() / 10,
          calContent.sinneL[calContent.listIndex + 2].toDouble() / 10,
          calContent.sinneL[calContent.listIndex + 3].toDouble() / 10,
          calContent.sinneL[calContent.listIndex + 4].toDouble() / 10,
          calContent.sinneL[calContent.listIndex + 5].toDouble() / 10
        ],
      ),
      Feature(
        title: headline[4]['tag'],
        color: variableColors[4],
        data: [
          calContent.herzL[calContent.listIndex + 0].toDouble() / 10,
          calContent.herzL[calContent.listIndex + 1].toDouble() / 10,
          calContent.herzL[calContent.listIndex + 2].toDouble() / 10,
          calContent.herzL[calContent.listIndex + 3].toDouble() / 10,
          calContent.herzL[calContent.listIndex + 4].toDouble() / 10,
          calContent.herzL[calContent.listIndex + 5].toDouble() / 10
        ],
      ),
      Feature(
        title: headline[5]['tag'],
        color: variableColors[5],
        data: [
          calContent.schlafL[calContent.listIndex + 0].toDouble() / 10,
          calContent.schlafL[calContent.listIndex + 1].toDouble() / 10,
          calContent.schlafL[calContent.listIndex + 2].toDouble() / 10,
          calContent.schlafL[calContent.listIndex + 3].toDouble() / 10,
          calContent.schlafL[calContent.listIndex + 4].toDouble() / 10,
          calContent.schlafL[calContent.listIndex + 5].toDouble() / 10
        ],
      ),
      Feature(
        title: headline[6]['tag'],
        color: variableColors[6],
        data: [
          calContent.nervenL[calContent.listIndex + 0].toDouble() / 10,
          calContent.nervenL[calContent.listIndex + 1].toDouble() / 10,
          calContent.nervenL[calContent.listIndex + 2].toDouble() / 10,
          calContent.nervenL[calContent.listIndex + 3].toDouble() / 10,
          calContent.nervenL[calContent.listIndex + 4].toDouble() / 10,
          calContent.nervenL[calContent.listIndex + 5].toDouble() / 10
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
                              "Die Grafik gibt an, wie stark die Symptome in den vergangenen 7 Tagen vom ausgewählten Tag an ausgeprägt waren.",
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
              const SizedBox(
                height: 5,
              ),
              LineGraph(
                features: features,
                size: const Size(350, 250),
                labelX: [
                  calContent.dateL[calContent.listIndex].toString(),
                  calContent.dateL[calContent.listIndex].toString(),
                  calContent.dateL[calContent.listIndex].toString(),
                  calContent.dateL[calContent.listIndex].toString(),
                  calContent.dateL[calContent.listIndex].toString(),
                  calContent.dateL[calContent.listIndex].toString()
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

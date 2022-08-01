import 'package:covidapp/covidapp/calendar_view/widgets/colors.dart';
import 'package:covidapp/covidapp/content/calendar_content.dart';
import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';

class BreatheGraph extends StatefulWidget {
  const BreatheGraph({Key? key}) : super(key: key);

  @override
  BreatheGraphState createState() => BreatheGraphState();
}

class BreatheGraphState extends State<BreatheGraph> {
  late List<Feature> features;
  late CalendarContent calContent;
  @override
  void initState() {
    calContent = CalendarContent();
    calContent.breatheMin;
    features = [
      Feature(
        title: "Gesamtlänge",
        color: AppColors.pieColors[3],
        data: calContent.breatheGraphTotalL()
        /* [
          calContent.breatheTotalL[calContent.currentDate - 7].toDouble() / 10,
          calContent.breatheTotalL[calContent.currentDate - 6].toDouble() / 10,
          calContent.breatheTotalL[calContent.currentDate - 5].toDouble() / 10,
          calContent.breatheTotalL[calContent.currentDate - 4].toDouble() / 10,
          calContent.breatheTotalL[calContent.currentDate - 3].toDouble() / 10,
          calContent.breatheTotalL[calContent.currentDate - 2].toDouble() / 10,
          calContent.breatheTotalL[calContent.currentDate - 1].toDouble() / 10,
        ] */
        ,
      ),
      Feature(
        title: "Atemlänge",
        color: AppColors.pieColors[5],
        data: calContent.breatheGraphSecL()
        /* [
          calContent.breatheSecL[calContent.currentDate - 7].toDouble() *
              70 /
              1000,
          calContent.breatheSecL[calContent.currentDate - 6].toDouble() *
              70 /
              1000,
          calContent.breatheSecL[calContent.currentDate - 5].toDouble() *
              70 /
              1000,
          calContent.breatheSecL[calContent.currentDate - 4].toDouble() *
              70 /
              1000,
          calContent.breatheSecL[calContent.currentDate - 3].toDouble() *
              70 /
              1000,
          calContent.breatheSecL[calContent.currentDate - 2].toDouble() *
              70 /
              1000,
          calContent.breatheSecL[calContent.currentDate - 1].toDouble() *
              70 /
              1000,
        ], */
        ,
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
                              "Die Grafik zeigt einen Vergleich zwischen den Werten Atemübungslänge (insgesamt) und Ein-Ausatmungsdauer (vergangene 7 Tage ab Auswahldatum).",
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
                labelX: calContent.graphLabelL(),
                labelY: const ['5', '10', '20', '30', '60'],
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

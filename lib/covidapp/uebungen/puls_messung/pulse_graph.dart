import 'package:covidapp/covidapp/calendar_view/widgets/colors.dart';
import 'package:covidapp/covidapp/content/calendar_content.dart';
import 'package:covidapp/covidapp/uebungen/exercise_data.dart';
import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PulseGraph extends StatefulWidget {
  const PulseGraph({Key? key}) : super(key: key);

  @override
  PulseGraphState createState() => PulseGraphState();
}

class PulseGraphState extends State<PulseGraph> {
  late List<Feature> features;
  late CalendarContent calContent;

  @override
  void initState() {
    calContent = CalendarContent();

    features = featureList(calContent.pulseGraphList);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final calContent = Provider.of<CalendarContent>(context);

    if (calContent.pulseGraphList.length <= 1) {
      setState(() {
        const ExerciseData("pulse");

        features = featureList(calContent.pulseGraphList);
      });
    }

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
                              "Die Grafik zeigt die Entwicklung der Pulsübung der letzten 7 Tage.",
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
          height: 500,
          width: 400,
          child: Stack(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 8.0, top: 22),
                child: Text("BPM"),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 225.0,
                  top: 380,
                ),
                child: Text("Tage"),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
             
          
                  const SizedBox(
                    height: 30,
                  ),
                  LineGraph(
                    features: featureList(calContent.pulseGraphList),
                    size: const Size(500, 400),
                    labelX: calContent.graphLabelL(),
                    labelY: const [
                      '20',
                      '40',
                      '60',
                      '80',
                      '100',
                      '120',
                    ],
                    showDescription: true,
                    graphColor: Colors.white54,
                    descriptionHeight: 5,
                  ),
                  const SizedBox(
                    height: 0,
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<Feature> featureList(List<double> featureListPuls) {
    List<Feature> features = [
      Feature(
        title: '''Herzschlag pro Minute : Ø''',
        color: AppColors.pieColors[5],
        data: featureListPuls,
      ),
    ];
    setState(() {
      features = [
        Feature(
          title: '''Herzschlag pro Minute : Ø''',
          color: AppColors.pieColors[5],
          data: featureListPuls,
        ),
      ];
    });
    return features;
  }
}

import 'package:covidapp/covidapp/calendar_view/widgets/colors.dart';
import 'package:covidapp/covidapp/content/calendar_content.dart';
import 'package:covidapp/covidapp/uebungen/exercise_data.dart';
import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
///graph for breathe data in breathe widget
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
    features = featureList(
        calContent.breatheGraphMinList, calContent.breatheGraphSecList);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final calContent = Provider.of<CalendarContent>(context);
    if (calContent.breatheGraphMinList.length <= 1 ||
        calContent.breatheGraphSecList.length <= 1) {
      setState(() {
        const ExerciseData("breathemin");
        const ExerciseData("breathesec");
        features = featureList(
            calContent.breatheGraphMinList, calContent.breatheGraphSecList);
      });
    }

    return Stack(
      children: [
        const ExerciseData("breathemin"),
        const ExerciseData("breathesec"),
        Container(
          alignment: Alignment.topRight,
          child: TextButton(
              onPressed: () {
                showDialog(
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
                            ]));
              },
              child: const Icon(
                Icons.info,
                color: Colors.white,
              )),
        ),
        Container(
          alignment: Alignment.center,
          height: 750,
          width: 750,
          child: Stack(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 8.0, top: 10),
                child: Text("Sekunden"),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0, top: 25),
                child: Text("Ein/Aus : Gesamt"),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 220.0,
                  top: 384,
                ),
                child: Text("Tage"),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
           
                  const SizedBox(
                    height: 0,
                  ),
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: LineGraph(
                      features: featureList(calContent.breatheGraphMinList,
                          calContent.breatheGraphSecList),
                      size: const Size(400, 700),
                      labelX: calContent.graphLabelL(),
                      labelY: const [
                        '2 : 20',
                        '4 : 40',
                        '6 : 60',
                        '8 : 80',
                        '10 : 100',
                        '12 : 120',
                        '14 : 140',
                        '16 : 160',
                        '18 : 180',
                        '20: 200',
                        '22: 220',
                        '24: 240',
                        '26: 260',
                        '28: 280',
                        '30: 300',
                      ],
                      showDescription: true,
                      graphColor: Colors.white54,
                      descriptionHeight: 5,
                    ),
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

  List<Feature> featureList(
      List<double> featureListMin, List<double> featureListSec) {
    List<Feature> features = [
      Feature(
        title: "Gesamtlänge",
        color: AppColors.pieColors[3],
        data: featureListMin,
      ),
      Feature(
        title: "Atemlänge",
        color: AppColors.pieColors[5],
        data: featureListSec,
      ),
    ];
    setState(() {
      features = [
        Feature(
          title: "Gesamtlänge",
          color: AppColors.pieColors[3],
          data: featureListMin,
        ),
        Feature(
          title: "Atemlänge",
          color: AppColors.pieColors[5],
          data: featureListSec,
        ),
      ];
    });
    return features;
  }
}

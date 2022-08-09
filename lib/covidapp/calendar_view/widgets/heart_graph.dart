import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidapp/covidapp/calendar_view/widgets/colors.dart';
import 'package:covidapp/covidapp/content/calendar_content.dart';
import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../content/strings.dart';
import '../../services/grafik_service.dart';
import '../../uebungen/exercise_data.dart';

class HeartGraph extends StatefulWidget {
  const HeartGraph({Key? key}) : super(key: key);

  @override
  HeartGraphState createState() => HeartGraphState();
}

class HeartGraphState extends State<HeartGraph> {
  late List<Feature> features;

  @override
  void initState() {
    calContent.bpmWeekL();
    features = featureList();
    /* [
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
    ]; */
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final calContent = Provider.of<CalendarContent>(context);
    final grafService = Provider.of<GrafikService>(context);

    features = featureList();

    if (calContent.pulseGraphList.length <= 1) {
      final CollectionReference calCollectionPulse = FirebaseFirestore.instance
          .collection('users')
          .doc(grafService.uid.toString())
          .collection('exercise');
      return FutureBuilder<DocumentSnapshot>(
          future: calCollectionPulse.doc('pulse').get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;

              calContent.weekheartMap(data);
              features = featureList();
            }
            return Text("lade Pulsdaten");
          });
    }

    final CollectionReference calCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(grafService.uid.toString())
        .collection('calendar');
    return StreamBuilder<QuerySnapshot>(
        stream: calCollection.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Es ist etwas schief gelaufen");
          }

          if (!snapshot.hasData) {
            return const Text("Daten nicht verfügbar");
          }
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Center(child: Text('Keine Daten'));
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            case ConnectionState.active:
              /*  Map<String, dynamic> data */

              List dataList = snapshot.data!.docs;
              /* .where((docs['id'] == calContent.grafikcurrentDateCal).map((docs)=>FindFollowerWidget(...))).toList(); as Map<String, dynamic>;
            */

              calContent.weekpiedataMap(dataList);

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
                          features: featureList(),
                          size: const Size(350, 250),
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
            case ConnectionState.done:
              // TODO: Handle this case.
              break;
          }
          return const Text("loading");
        });
  }

  List<Feature> featureList() {
    List<Feature> features = [
      Feature(
        title: '''Herzschlag pro Minute : Ø''',
        color: AppColors.pieColors[5],
        data: calContent.weekGraphMap("pulse"),
      ),
      Feature(
        title: headline[4]['tag'],
        color: AppColors.pieColors[3],
        data: calContent.weekGraphMap("herz"),
      ),
    ];
    return features;
  }

  List<double> pulseData(Map<String, dynamic> data) {
    List<double> doubleData = [];
    for (int index = 0; index < 32; index++) {
      if (data[index.toString()] != null) {
        doubleData.add(double.parse(data[index.toString()].toString()));
      } else if (data[index.toString()] == null) {
        doubleData.add(0);
      }
    }
    return doubleData;
  }
}

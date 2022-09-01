import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidapp/covidapp/calendar_view/widgets/colors.dart';
import 'package:covidapp/covidapp/content/calendar_content.dart';
import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../content/strings.dart';
import '../../services/grafik_service.dart';

class WeekGraph extends StatefulWidget {
  const WeekGraph({Key? key}) : super(key: key);

  @override
  WeekGraphState createState() => WeekGraphState();
}

class WeekGraphState extends State<WeekGraph> {
  late List<Feature> features;

  @override
  void initState() {
    features = featureList();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final grafService = Provider.of<GrafikService>(context);
    final calContent = Provider.of<CalendarContent>(context);
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
         
              List dataList = snapshot.data!.docs;
            

              calContent.weekpiedataMap(dataList);

              features = featureList();

              return
          
                  Stack(
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
                          features: featureList(),
                          size: const Size(350, 250),
                          labelX: calContent.weekgraphLabelL(),
                          labelY: const ['20%', '40%', '60%', '80%', '100%'],
                          showDescription: true,
                          graphColor: Colors.white54,
                          descriptionHeight: 5,
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
              break;
          }
          return const Text("laden");
        });
  }

  List<Feature> featureList() {
    features = [
      Feature(
        title: headline[0]['tag'],
        color: AppColors.pieColors[7],
        data: calContent.weekGraphMap("mood"),
      ),
      Feature(
        title: headline[1]['tag'],
        color: AppColors.pieColors[0],
        data: calContent.weekGraphMap("muedigkeit"),
      ),
      Feature(
        title: headline[2]['tag'],
        color: AppColors.pieColors[1],
        data: calContent.weekGraphMap("atemnot"),
      ),
      Feature(
        title: headline[3]['tag'],
        color: AppColors.pieColors[2],
        data: calContent.weekGraphMap("sinne"),
      ),
      Feature(
        title: headline[4]['tag'],
        color: AppColors.pieColors[3],
        data: calContent.weekGraphMap("herz"),
      ),
      Feature(
        title: headline[5]['tag'],
        color: AppColors.pieColors[4],
        data: calContent.weekGraphMap("schlaf"),
      ),
      Feature(
        title: headline[6]['tag'],
        color: AppColors.pieColors[5],
        data: calContent.weekGraphMap("nerven"),
      ),
    ];

    return features;
  }
}

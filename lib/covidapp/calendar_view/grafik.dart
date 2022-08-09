import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidapp/covidapp/calendar_view/grafik_tab_bar.dart';
import 'package:covidapp/covidapp/content/calendar_content.dart';
import 'package:covidapp/covidapp/content/grafik_content.dart';
import 'package:covidapp/covidapp/content/size.dart';
import 'package:covidapp/covidapp/content/strings.dart';
import 'package:covidapp/covidapp/calendar_view/grafik_data_stream.dart';
import 'package:covidapp/covidapp/services/grafik_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'widgets/arrow_button.dart';

class Grafik extends StatefulWidget {
  const Grafik({Key? key}) : super(key: key);

  @override
  GrafikState createState() => GrafikState();
}

class GrafikState extends State<Grafik> {
  late bool dayChange;
  late final GrafikService gS;
  late final GrafikContent grafC;
  List? docList;
  int currentDateInt = 0;

  final calDocStream = FirebaseFirestore.instance
      .collection('users')
      .doc("Hp3voKpg1hZE9uhfMHXjROc8lw72")
      .collection('calendar')
      .doc("20")
      .snapshots();
  @override
  void initState() {
    currentDateInt =
        int.parse(DateFormat('d').format(DateTime.now()).toString());
    dayChange = false;
    gS = GrafikService();
    gS.dailyRead(currentDateInt, dayChange);
    docList = gS.docList;
    // ignore: avoid_print
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  ///
  /// Data for grafik variable list
  ///
  @override
  Widget build(BuildContext context) {
    final grafService = Provider.of<GrafikService>(context);
    final calContent = Provider.of<CalendarContent>(context);
    /*  final Stream<QuerySnapshot> calStream = FirebaseFirestore.instance
        .collection('users')
        .doc(grafService.uid)
        .collection('calendar')
        .snapshots(); */
    double fontSize(double size) {
      return size * SizeConfig.getWidth(context) / 414;
    }

    return Container(
      height: 495,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0)),
        gradient: LinearGradient(
          colors: [Color(0xFF31A1C9), Color.fromARGB(255, 6, 84, 104)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    height: 25,
                    width: 30,
                    decoration: BoxDecoration(
                        color:
                            /* calContent.getCalendarColorSum(calContent.sumColor), */
                            calContent.getLevel(calContent.sumColor.toInt()),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 20.0,
                            spreadRadius: 2.0,
                          )
                        ]),
                    margin: EdgeInsets.only(
                        left: SizeConfig.getWidth(context) / 45),
                    child: Center(
                      child: Text(
                        currentDateInt.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: fontSize(17),
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )),
                Container(
                  width: 150,
                  margin: const EdgeInsets.only(
                    right: 5,
                    top: 10,
                  ),
                  /*  child: Column(children: [
                    Row(
                      children: [
                        const Text(
                          "Ausgezeichnet      ",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        Icon(
                          Icons.rectangle,
                          size: 15,
                          color: AppColors.pieColors[2],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "Handlungsbedarf ",
                          style: TextStyle(fontSize: 12, color: Colors.white),
                        ),
                        const Divider(
                          thickness: 1,
                        ),
                        Icon(
                          Icons.rectangle,
                          size: 15,
                          color: AppColors.pieColors[5],
                        )
                      ],
                    )
                  ]), */
                ),
                Container(
                  width: SizeConfig.getWidth(context) / 3.7,
                  height: 30,
                  margin: EdgeInsets.only(
                      right: SizeConfig.getWidth(context) / 45, top: 1),
                  child: Row(
                    children: <Widget>[
                      ArrowButton(
                          margin: const EdgeInsets.only(bottom: 5, top: 2),
                          iconbutton: IconButton(
                            padding: const EdgeInsets.all(5),
                            icon: Icon(
                              Icons.arrow_back_ios,
                              size: fontSize(16),
                              color: const Color.fromARGB(255, 6, 84, 104),
                            ),
                            onPressed: () {
                              setState(() {
                                dayChange = false;
                                currentDate();
                                calContent.getGrafikDate(currentDateInt);
                                /*  calContent.getgrafikCurrentDate(currentDateInt); */
                                /* calContent.getCalendarList(); */
                                grafService.dailyRead(
                                    currentDateInt, dayChange);
                                grafService.docId = currentDateInt;
                              });
                            },
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.getWidth(context) / 50)),
                      ArrowButton(
                        margin: const EdgeInsets.only(bottom: 5, top: 2),
                        iconbutton: IconButton(
                          padding: const EdgeInsets.all(5),
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            size: fontSize(16),
                            color: const Color.fromARGB(255, 6, 84, 104),
                          ),
                          onPressed: () {
                            setState(() {
                              dayChange = true;
                              currentDate();
                              calContent.getGrafikDate(currentDateInt);

                              /*  calContent.getgrafikCurrentDate(currentDateInt); */
                              /*   calContent.getCalendarList(); */

                              grafService.dailyRead(currentDateInt, dayChange);
                              headline;
                              grafService.docId = currentDateInt;
                              if (kDebugMode) {
                                print(currentDateInt);
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          GrafikDataStream((currentDateInt).toString(), gS.uid!),
          /*   Column( 
            children: [
              Center(
                  child: StreamBuilder<QuerySnapshot>(
                stream: calStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshots) {
                  if (!snapshots.hasData) {
                    return const Center(
                      child: Text(
                        'Data not available',
                      ),
                    );
                  }
                  if (snapshots.connectionState == ConnectionState.waiting) {
                    return const Text("Loading");
                  }

                  return ListView(
                    shrinkWrap: true,
                    children:
                        snapshots.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      return ListTile(
                        title: Text(data['atemnot']),
                        subtitle: Text(data['schlaf']),
                      );
                    }).toList(),
                  );
                },
              )),
            ],
          ), */
          const SizedBox(
            height: 5.0,
          ),
          const SizedBox(
            height: 318,
            width: 400,

            /// TabBar inclusion
            child: Expanded(child: GrafikTabBar()),
          ),
          /* Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: headline.map((data) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                                color: data['color'], shape: BoxShape.circle),
                          ),
                          Text(
                            data['name'].toString(),
                            style: TextStyle(
                              fontSize: fontSize(12),
                              color: data['level'],
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              (data['value'] * 10).toString(),
                              style: TextStyle(
                                fontSize: fontSize(12),
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              const SizedBox(
                height: 318,
                width: 400,

                /// TabBar inclusion
                child: GrafikTabBar(),
              ), */
        ],
      ),
    );
  }

  bool currentDate() {
    setState(() {
      if (dayChange == true) {
        if (currentDateInt == 31) {
          // DateFormat('d').format(DateTime.now()).toString()) {
          dayChange = false;
        } else {
          currentDateInt += 1;
          dayChange = false;
        }
      } else if (dayChange == false) {
        if (currentDateInt == 1) {
          dayChange = true;
        } else {
          currentDateInt -= 1;
          dayChange = true;
        }
      }
    });
    return dayChange;
  }
}

import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidapp/Mozido/calendar_view/grafik_tab_bar.dart';
import 'package:covidapp/Mozido/content/calendar_content.dart';
import 'package:covidapp/Mozido/content/grafik_content.dart';
import 'package:covidapp/Mozido/content/size.dart';
import 'package:covidapp/Mozido/content/strings.dart';
import 'package:covidapp/Mozido/services/grafik_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
//import 'package:flutter_sparkline/flutter_sparkline.dart';

import 'widgets/arrow_button.dart';

class T2Grafik extends StatefulWidget {
  const T2Grafik({Key? key}) : super(key: key);

  @override
  T2GrafikState createState() => T2GrafikState();
}

class T2GrafikState extends State<T2Grafik> {
  /*  late List<charts.Series<GrafikContent, String>> _seriesBarData;
  late List<GrafikContent> grafikData;
  _generateData(grafikData) {
    _seriesBarData = <charts.Series<GrafikContent, String>>[];
    _seriesBarData.add(
      charts.Series(
        domainFn: (GrafikContent graph, _) => graph.mood.toString(),
        measureFn: (GrafikContent graph, _) => int.parse(graph.muedigkeit),
        //grafikcolor
        colorFn: (GrafikContent graph, _) =>
            charts.ColorUtil.fromDartColor(Color(0xFF313237)),
        id: 'Sales',
        data: grafikData,
        labelAccessorFn: (GrafikContent row, _) => "$row.create_date",
      ),
    );
  } */

  late bool dayChange;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  late final GrafikService gS;
  late final GrafikContent grafC;
  List? docList;
  int current_date = 0;
 
/*   DateTime year = DateTime(DateTime.now().year); */
  /* int numOfWeeks(int year) {
    DateTime dec28 = DateTime(year, 12, 28);
    int dayOfDec28 = int.parse(DateFormat("D").format(dec28));
    return ((dayOfDec28 - dec28.weekday + 10) / 7).floor();
  } */

  @override
  initState() {
    current_date = int.parse(DateFormat('d').format(DateTime.now()).toString());
    dayChange = false;
    gS = GrafikService();
    gS.dailyRead(current_date, dayChange);
    docList = gS.docList;
    // ignore: avoid_print  
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  /*  int weekNumber(DateTime date) {
    int dayOfYear = int.parse(DateFormat("D").format(date));
    int woy = ((dayOfYear - date.weekday + 10) / 7).floor();
    if (woy < 1) {
      woy = numOfWeeks(date.year - 1);
    } else if (woy > numOfWeeks(date.year)) {
      woy = 1;
    }
    return woy;
  } */

  @override

  ///
  /// Data for grafik line
  ///
  Widget build(BuildContext context) {
    final grafService = Provider.of<GrafikService>(context);
    final calContent = Provider.of<CalendarContent>(context);

    double fontSize(double size) {
      return size * SizeConfig.getWidth(context) / 414;
    }

    //list of weeks here with different views in iconbutton on Click
    /// Calculates number of weeks for a given year as per https://en.wikipedia.org/wiki/ISO_week_date#Weeks_per_year

    /// Calculates week number from a date as per https://en.wikipedia.org/wiki/ISO_week_date#Calculation

    return Container(
      height: 500,
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
            height: SizeConfig.getHeight(context) / 14,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    height: 40,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 20.0,
                            spreadRadius: 2.0,
                          )
                        ]),
                    margin: EdgeInsets.only(
                        left: SizeConfig.getWidth(context) / 20),
                    child: Center(
                      child: Text(
                        current_date.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: fontSize(25),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )),
                Container(
                  width: SizeConfig.getWidth(context) / 3.7,
                  margin:
                      EdgeInsets.only(right: SizeConfig.getWidth(context) / 30),
                  child: Row(
                    children: <Widget>[
                      ArrowButton(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          iconbutton: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              size: fontSize(17),
                            ),
                            onPressed: () {
                              setState(() {
                                dayChange = false;
                                currentDate();
                                calContent.getCalendarList(dayChange);
                                grafService.dailyRead(current_date, dayChange);
                              });
                            },
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.getWidth(context) / 50)),
                      ArrowButton(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        iconbutton: IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            size: fontSize(17),
                          ),
                          onPressed: () {
                            setState(() {
                              dayChange = true;
                              currentDate();
                              calContent.getCalendarList(dayChange);
                              grafService.dailyRead(current_date, dayChange);
                              if (kDebugMode) {
                                print(current_date);
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
          Column(
            children: <Widget>[
              Center(
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
                              color: Colors.white,
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
              Container(
                height: 320,
                width: 400,
                child: //const GrafikTabBar(),
                    GrafikTabBar(),

                // PieChart(grafikData: calContent.getCalendarList()),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void currentDate() {
    setState(() {
      String cur_date = current_date.toString();
      if (dayChange) {
        if (cur_date == DateFormat('d').format(DateTime.now()).toString()) {
          dayChange = false;
        } else {
          current_date += 1;
          dayChange = false;
        }
      } else if (!dayChange) {
        if (current_date == 1) {
          dayChange = true;
        } else {
          current_date -= 1;
          dayChange = true;
        }
      }
      cur_date = current_date.toString();
    });
  }
}
/*
            ],
          ),

                ///
                /// Value grafik
                ///
               /* Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Februar",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Popins",
                            fontSize: 11.5),
                      ),
                      Text(
                        "März",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Popins",
                            fontSize: 11.5),
                      ),
                      Text(
                        "April",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Popins",
                            fontSize: 11.5),
                      ),
                      Text(
                        "Mai",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Popins",
                            fontSize: 11.5),
                      ),
                      Text(
                        "Juni",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Popins",
                            fontSize: 11.5),
                      ),
                      Text(
                        "Juli",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Popins",
                            fontSize: 11.5),
                      ),
                    ],
                  ),

                */


            SizedBox(
              height: 30.0,
            ),

            ///
            /// Card under grafic line
            ///
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 370.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Color(0xFF363940),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                          )
                        ]),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 90.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0)),
                              gradient: LinearGradient(
                                colors: [Color(0xFF31A1C9), Color(0xFF3DB6D4)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              )),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 30.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[

                                   /*   Text(
                                        "Tageszustand",
                                        style: TextStyle(
                                            fontFamily: "Sans",
                                            fontSize: 24.0,
                                            color: Colors.white70),
                                      ),*/
                                      Padding(
                                        padding: const EdgeInsets.only(top: 5.0),

                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 35.0,
                                  width: 35.0,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                      color: Colors.white),
                                  child: Icon(Icons.emoji_emotions,
                                      color: Color(0xFF3DB6D4)),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0, right: 20.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        height: 30.0,
                                        width: 3.0,
                                        color: Colors.white12,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20.0),
                                       /* child: Text(
                                          "Prächtig",
                                          style: TextStyle(
                                              fontFamily: "Sans",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17.5,
                                              letterSpacing: 1.5,
                                              color: Colors.white70),
                                        ),*/
                                      )
                                    ],
                                  ),
                                  Text(
                                    "Februar",
                                    style: TextStyle(
                                        fontFamily: "Sans", color: Colors.white70),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        height: 30.0,
                                        width: 3.0,
                                        color: Colors.white12,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20.0),
                                        /*child: Text(
                                          "Abgeschlossen",
                                          style: TextStyle(
                                              fontFamily: "Sans",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17.5,
                                              letterSpacing: 1.5,
                                              color: Colors.white70),
                                        ),*/
                                      )
                                    ],
                                  ),
                                /*  Text(
                                    "März",
                                    style: TextStyle(
                                        fontFamily: "Sans", color: Colors.white70),
                                  )*/
                                ],
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        height: 30.0,
                                        width: 3.0,
                                        color: Colors.yellow,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20.0),
                                       /* child: Text(
                                          "Offen",
                                          style: TextStyle(
                                              fontFamily: "Sans",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17.5,
                                              letterSpacing: 1.5,
                                              color: Colors.white70),
                                        ),*/
                                      ),
                                    ],
                                  ),
                                 /* Text(
                                    "April ",
                                    style: TextStyle(
                                        fontFamily: "Sans", color: Colors.white70),
                                  )*/
                                ],
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Container(
                                        height: 30.0,
                                        width: 3.0,
                                        color: Colors.white12,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 20.0),
                                       /* child: Text(
                                          "Abgeschlossen",
                                          style: TextStyle(
                                              fontFamily: "Sans",
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17.5,
                                              letterSpacing: 1.5,
                                              color: Colors.white70),
                                        ),*/
                                      )
                                    ],
                                  ),
                                 /* Text(
                                    "Mai",
                                    style: TextStyle(
                                        fontFamily: "Sans", color: Colors.white70),
                                  )*/
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
          ],
        ),
    );
  }
}*/

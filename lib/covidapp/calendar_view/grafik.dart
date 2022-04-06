import 'package:covidapp/covidapp/calendar_view/grafik_tab_bar.dart';
import 'package:covidapp/covidapp/calendar_view/widgets/colors.dart';
import 'package:covidapp/covidapp/content/calendar_content.dart';
import 'package:covidapp/covidapp/content/grafik_content.dart';
import 'package:covidapp/covidapp/content/size.dart';
import 'package:covidapp/covidapp/content/strings.dart';
import 'package:covidapp/covidapp/services/grafik_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'widgets/arrow_button.dart';

class T2Grafik extends StatefulWidget {
  const T2Grafik({Key? key}) : super(key: key);

  @override
  T2GrafikState createState() => T2GrafikState();
}

class T2GrafikState extends State<T2Grafik> {
  late bool dayChange;
  late final GrafikService gS;
  late final GrafikContent grafC;
  List? docList;
  int current_date = 0;

  @override
  void initState() {
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

  ///
  /// Data for grafik variable list
  ///
  @override
  Widget build(BuildContext context) {
    final grafService = Provider.of<GrafikService>(context);
    final calContent = Provider.of<CalendarContent>(context);

    double fontSize(double size) {
      return size * SizeConfig.getWidth(context) / 414;
    }

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
                          color: calContent.getCalendarColorSum(),
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

                                calContent.getgrafikCurrentDate(current_date);
                                calContent.getCalendarList();
                                calContent.getCalendarColorSum();
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
                              calContent.getgrafikCurrentDate(current_date);
                              calContent.getCalendarList();
                              calContent.getCalendarColorSum();
                              grafService.dailyRead(current_date, dayChange);
                              headline;
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
                height: 320,
                width: 400,
                /// TabBar inclusion
                child: GrafikTabBar(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  bool currentDate() {
    setState(() {
      String cur_date = current_date.toString();
      if (dayChange == true) {
        if (cur_date == DateFormat('d').format(DateTime.now()).toString()) {
          dayChange = false;
        } else {
          current_date += 1;
          dayChange = false;
        }
      } else if (dayChange == false) {
        if (current_date == 1) {
          dayChange = true;
        } else {
          current_date -= 1;
          dayChange = true;
        }
      }
      cur_date = current_date.toString();
    });
    return dayChange;
  }
}

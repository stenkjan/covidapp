// ignore_for_file: no_logic_in_create_state, sized_box_for_whitespace, unused_local_variable, unused_import, file_names

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:covidapp/covidapp/calendar_view/widgets/calendar_tabs/calendar_atemnot.dart';
import 'package:covidapp/covidapp/calendar_view/widgets/calendar_tabs/calendar_herz.dart';
import 'package:covidapp/covidapp/calendar_view/widgets/calendar_tabs/calendar_mood.dart';
import 'package:covidapp/covidapp/calendar_view/widgets/calendar_tabs/calendar_muedigkeit.dart';
import 'package:covidapp/covidapp/calendar_view/widgets/calendar_tabs/calendar_nerven+com.dart';
import 'package:covidapp/covidapp/calendar_view/widgets/calendar_tabs/calendar_schlaf.dart';
import 'package:covidapp/covidapp/calendar_view/widgets/calendar_tabs/calendar_sinne.dart';
import 'package:covidapp/covidapp/content/calendar_content.dart';
import 'package:covidapp/covidapp/content/size.dart';
import 'package:covidapp/covidapp/content/strings.dart';
import 'package:covidapp/covidapp/login/widgets/rounded_button.dart';
import 'package:covidapp/covidapp/services/calendar_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'pages/complex_example.dart';
import 'widgets/arrow_button.dart';
///calendar main widget for calendar widget and symptom tab bar (calendar_tab_bar)
class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  CalendarState createState() => CalendarState();
}

class CalendarState extends State<Calendar> {
  var questionChoices = <String>[];
  int arrowCount = 0;
  bool upToggle = false;
  bool downToggle = false;
  int currentDate = 0;
  bool calVisibleB = true;
  double widthValue = 25;
  Icon icon = const Icon(
    Icons.close_fullscreen,
    color: Colors.white54,
    size: 20,
  );
  @override
  void initState() {
    currentDate = int.parse(DateFormat('d').format(DateTime.now()).toString());
 

    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  ///
  /// build Calendar Widget and Variable input through calendar_tab_bar integration
  @override
  Widget build(BuildContext context) {
    final calContent = Provider.of<CalendarContent>(context);
    final calService = Provider.of<CalendarService>(context);

    if (calVisibleB) {
      icon = const Icon(
        Icons.close_fullscreen,
        color: Colors.white54,
        size: 23,
      );
      widthValue = 25;
    }
    if (!calVisibleB) {
      icon = const Icon(
        Icons.open_in_full,
        color: Colors.white54,
        size: 22,
      );
      widthValue = 100;
    }
    return Scaffold(
      backgroundColor: const Color(0xFF313237),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Stack(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(18.0, 8.0, 8.0, 8.0),
                child: Visibility(
                    visible: calVisibleB, child: TableComplexExample()),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18.0, 8.0, 8.0, 8.0),
                child: SizedBox(
                  height: 25,
                  width: widthValue,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        enableFeedback: true,
                        visualDensity: VisualDensity.compact,
                        fixedSize: const Size(25, 25),
                        primary: const Color.fromARGB(179, 2, 156, 245),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: const BorderSide(color: Color(0x815DDFDF)),
                        ),
                      ),
                      child: Row(
                        children: [
                          icon,
                          Visibility(
                            visible: !calVisibleB,
                            child: const SizedBox(
                              width: 5,
                            ),
                          ),
                          Visibility(
                              visible: !calVisibleB,
                              child: const Text(
                                "Kalender",
                                style: TextStyle(color: Colors.white),
                              ))
                        ],
                      ),
                      onPressed: () {
                        setState(() {
                          if (calVisibleB == true) {
                            calVisibleB = false;
                          } else if (calVisibleB == false) {
                            calVisibleB = true;
                          }
                        });
                        // ignore: use_build_context_synchronously
                      }),
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 370,
                height: 450,
                child: DefaultTabController(
                  length: 7,
                  child: Scaffold(
                    backgroundColor: Colors.transparent,
                    appBar: PreferredSize(
                      preferredSize: const Size.fromHeight(
                          42.0), // here the desired height
                      child: AppBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0.0,
                        centerTitle: true,
                        automaticallyImplyLeading: false,
                        title: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15.0)),
                              border: Border.all(color: Colors.black54),
                              color: Colors.black26),
                          child: TabBar(
                            indicatorColor: const Color(0xFF31A1C9),
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.white54,
                            indicator: ShapeDecoration.fromBoxDecoration(
                                const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15.0)),
                                    color: Color(0xFF31A1C9))),
                            tabs: const [
                              Tab(
                                child: Icon(
                                  Icons.mood,
                                  size: 17.0,
                                ),
                              ),
                              Tab(
                                  child: Icon(
                                Icons.sentiment_very_dissatisfied,
                                size: 17.0,
                              )),
                              Tab(
                                  child: Icon(
                                Icons.air,
                                size: 17.0,
                              )),
                              Tab(
                                  child: Icon(
                                Icons.sensors,
                                size: 17.0,
                              )),
                              Tab(
                                  child: Icon(
                                Icons.monitor,
                                size: 17.0,
                              )),
                              Tab(
                                  child: Icon(
                                Icons.night_shelter,
                                size: 17.0,
                              )),
                              Tab(
                                  child: Icon(
                                Icons.psychology,
                                size: 17.0,
                              )),
                            ],
                          ),
                        ),
                      ),
                    ),

                    ///
                    /// Body tabBar
                    ///
                    body: const TabBarView(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                          child: CalendarMood(),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                          child: CalendarMuedigkeit(),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                          child: CalendarAtemnot(),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                          child: CalendarSinne(),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                          child: CalendarHerz(),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                          child: CalendarSchlaf(),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                          child: CalendarNervCom(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
     
    );
  }
}

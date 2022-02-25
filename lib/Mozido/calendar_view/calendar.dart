// ignore_for_file: no_logic_in_create_state, sized_box_for_whitespace, unused_local_variable, unused_import, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidapp/Mozido/calendar_view/widgets/calendar_tabs/calendar_atemnot.dart';
import 'package:covidapp/Mozido/calendar_view/widgets/calendar_tabs/calendar_herz.dart';
import 'package:covidapp/Mozido/calendar_view/widgets/calendar_tabs/calendar_mood.dart';
import 'package:covidapp/Mozido/calendar_view/widgets/calendar_tabs/calendar_muedigkeit.dart';
import 'package:covidapp/Mozido/calendar_view/widgets/calendar_tabs/calendar_nerven+com.dart';
import 'package:covidapp/Mozido/calendar_view/widgets/calendar_tabs/calendar_schlaf.dart';
import 'package:covidapp/Mozido/calendar_view/widgets/calendar_tabs/calendar_sinne.dart';
import 'package:covidapp/Mozido/content/calendar_content.dart';
import 'package:covidapp/Mozido/content/size.dart';
import 'package:covidapp/Mozido/content/strings.dart';
import 'package:covidapp/Mozido/login/widgets/rounded_button.dart';
import 'package:covidapp/Mozido/services/calendar_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_sparkline/flutter_sparkline.dart';

import 'calendar_form.dart';
import 'widgets/arrow_button.dart';

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
  @override
  initState() {
    currentDate = int.parse(DateFormat('d').format(DateTime.now()).toString());
    print(currentDate.toString());
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  @override

  ///
  /// Data for grafik line
  ///
/*  var _data = [
    0.0,
    0.5,
    0.9,
    1.4,
    2.2,
    1.0,
    3.3,
    0.0,
    -0.5,
    -1.0,
    -0.5,
    0.0,
    0.0
  ];*/

  Widget build(BuildContext context) {
    double fontSize(double size) {
      return size * SizeConfig.getWidth(context) / 414;
    }

    final calContent = Provider.of<CalendarContent>(context);
    final calService = Provider.of<CalendarService>(context);

    return Scaffold(
      backgroundColor: const Color(0xFF313237),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 00.0,
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(width: 370, child: const CalendarForm())),
          Expanded(
            child: DefaultTabController(
              length: 7,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: PreferredSize(
                  preferredSize:
                      const Size.fromHeight(42.0), // here the desired height
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
                      padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                      child: CalendarMood(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                      child: CalendarMuedigkeit(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                      child: CalendarAtemnot(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                      child: CalendarSinne(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                      child: CalendarHerz(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                      child: CalendarSchlaf(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                      child: CalendarNervCom(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Opacity(
        opacity: calContent.count.toDouble(),
        child: FloatingActionButton.extended(
          onPressed: () {
            if (calContent.docExists == false) {              
                   calService.dailyTask(
                  calContent.mood,
                  calContent.muedigkeit,
                  calContent.atemnot,
                  calContent.sinne,
                  calContent.herz,
                  calContent.schlaf,
                  calContent.nerven,
                  calContent.comment,
                  currentDate);
              calContent.clear();
            }
          },
          // tooltip: "Bestätigen",
          //foregroundColor: const Color(0xFF31A1C9),
          backgroundColor: const Color(0xFF31A1C9),
          label: const Text(
            "Speichern",
            style: TextStyle(color: Colors.white),
          ),
          icon: const Icon(Icons.save_alt),
        ),
      ),
    );

    ///
    /// Card under grafic line
    ///
/* 
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200.0,
        width: 370.0,
        //width: double.infinity,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            gradient: LinearGradient(
              colors: [Color(0xFF363940), Color(0xFF2E4E57)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
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
              height: 50.0,
              width: double.infinity,
              decoration: const BoxDecoration(
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
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            headline[arrowCount]['tag'] ?? 'null',
                            // headline[arrow_up_count],
                            style: const TextStyle(
                                fontFamily: "Sans",
                                fontSize: 28.0,
                                color: Colors.white70),
                          ),
                          // SizedBox(width: 10.0),
                        ],
                      ),
                    ),
                    /* Container(
                              margin: EdgeInsets.only(bottom: 4),
                              height: 35.0,
                              width: 35.0,
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                                  color: AppColors.primaryWhite),
                              child: Icon(Icons.emoji_emotions,
                                  color: Color(0xFF3DB6D4)),
                            ),*/
                    const SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      width: SizeConfig.getWidth(context) / 4.5,
                      margin: EdgeInsets.only(
                          right: SizeConfig.getWidth(context) / 50,
                          bottom: 2.0,
                          left: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          ArrowButton(
                            iconbutton: IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                size: fontSize(17),
                              ),
                              onPressed: () {
                                downToggle = true;
                                toggleHeadline();
                                calendarVisualizer();
                              },
                            ),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 3, vertical: 7),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: SizeConfig.getWidth(context) / 50)),
                          ArrowButton(
                            iconbutton: IconButton(
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                size: fontSize(17),
                              ),
                              onPressed: () {
                                upToggle = true;

                                toggleHeadline();
                                calendarVisualizer();
                              },
                            ),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 3, vertical: 6),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
 */
    //new LOGIC here
    /*     Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 0.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF31A1C9),
                                      Color(0xFF3DB6D4)
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: Center(
                                  child: RichText(
                                    text: TextSpan(
                                        text: moodList[0]['icon1'] ??
                                            'null', // emoji characters
                                        style: const TextStyle(
                                          fontFamily: 'EmojiOne',
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            questionChoices.add(
                                                calenderChoices[arrowCount]
                                                    ['item1']);
                                            questionChoice();
                                            //method giving data to calendar;
                                          }),
                                  ),
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF31A1C9),
                                      Color(0xFF3DB6D4)
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: Center(
                                  child: RichText(
                                    text: TextSpan(
                                        text: calenderChoices[arrowCount]
                                                ['icon2'] ??
                                            'null', // emoji characters
                                        style: const TextStyle(
                                          fontFamily: 'EmojiOne',
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            questionChoices.add(
                                                calenderChoices[arrowCount]
                                                    ['item2']);
                                            questionChoice();
                                            //method giving data to calendar;
                                          }),
                                  ),
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF31A1C9),
                                      Color(0xFF3DB6D4)
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: Center(
                                  child: RichText(
                                    text: TextSpan(
                                        text: calenderChoices[arrowCount]
                                                ['icon3'] ??
                                            'null', // emoji characters
                                        style: const TextStyle(
                                          fontFamily: 'EmojiOne',
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            questionChoices.add(
                                                calenderChoices[arrowCount]
                                                    ['item3']);
                                            questionChoice();
                                            //method giving data to calendar;
                                          }),
                                  ),
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF31A1C9),
                                      Color(0xFF3DB6D4)
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: Center(
                                  child: RichText(
                                    text: TextSpan(
                                        text: calenderChoices[arrowCount]
                                                ['icon4'] ??
                                            'null', // emoji characters
                                        style: const TextStyle(
                                          fontFamily: 'EmojiOne',
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            questionChoices.add(
                                                calenderChoices[arrowCount]
                                                    ['item4']);
                                            questionChoice();
                                            //method giving data to calendar;
                                          }),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 360,
                                height: 25,
                                child: SizedBox(
                                  child: Text(
                                      calenderChoices[arrowCount]['name'] +
                                          ": " +
                                          calenderChoices[arrowCount]['item1'] +
                                          " - " +
                                          calenderChoices[arrowCount]['item4'],
                                      maxLines: 1,
                                      overflow: TextOverflow.fade,
                                      softWrap: false,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontFamily: "Sans",
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white70)),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Provider.of<T2_Calendar>(context,
                                  //         listen: false)
                                  //     .showAddDialog;
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: const BorderSide(
                                        color: Color(0xFF31A1C9)),
                                  ),
                                ),
                                child: const Text(
                                  'Kommentar',
                                ),
                              ),
                              const SizedBox(width: 15),
                              IconButton(
                                  color: const Color(0xB0E4DD09),
                                  iconSize: 40,
                                  icon: const Icon(Icons.help),
                                  onPressed: () {}),
                            ],
                          ),
                        ],
                      ),
                    ),
                    */
    //new LOGIC ends here
    /*     ],
        ),
      ),
    ); */
    const SizedBox(
      height: 30.0,
    );
    /*   ],
        ),
      ),
    );  */
  }

/*   void toggleHeadline() {
    setState(() {
      if (upToggle) {
        arrowCount++;

        if (arrowCount > calenderChoices.length - 1) {
          arrowCount = 0;
        }
        upToggle = false;
      } else if (downToggle) {
        arrowCount--;

        if (arrowCount < 0) {
          arrowCount = calenderChoices.length - 1;
        }
        downToggle = false;
      }
    });
  }
 */

  /* void questionChoice() {
    String questionChoiceString = questionChoices.last;
    itemSwitch = true;
    if (widget.itemSwitch) {
      questionChoiceString = questionChoices.last;
    } else {
      questionChoiceString = "";
    }
    itemSwitch = false;
    //return  question_choice;
  } */
}
import 'package:covidapp/Mozido/content/size.dart';
import 'package:covidapp/Mozido/content/strings.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_sparkline/flutter_sparkline.dart';

import 't2_calendar_form.dart';
import 'charts/arrow_button.dart';

class T2Kalender extends StatefulWidget {
  final bool itemSwitch;
  final String questionChoiceString;
  const T2Kalender({Key? key, required this.itemSwitch, required this.questionChoiceString}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  T2KalenderState createState() => T2KalenderState(itemSwitch: itemSwitch, questionChoiceString: questionChoiceString);
}

class T2KalenderState extends State<T2Kalender> {
  bool itemSwitch = false;
  String questionChoiceString;
  T2KalenderState({required this.itemSwitch,required this.questionChoiceString});
  @override
  void initState() {
    super.initState();
    toggleHeadline();
  }
  List <String> headline = const ["Zustand", "Härtefaelle", "Krankheitsgrad"];
  var questionChoices = <String>[];
  int arrowCount = 0;
  bool upToggle = false;
  bool downToggle = false;


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
    return Scaffold(
      backgroundColor: const Color(0xFF313237),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 00.0,
            ),
            Container(
              height: 230.0,
              child: Expanded(
                child:T2_Calendar(),),),
            const SizedBox(
              height: 5.0,
            ),

            ///
            /// Card under grafic line
            ///
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 300.0,
                width: 370.0,
                //width: double.infinity,
                decoration: const BoxDecoration(
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
                                    calenderChoices[arrowCount]['name'] ?? 'null',
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

                                      },
                                    ),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 3, vertical: 7),
                                  ),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: SizeConfig.getWidth(context) /
                                              50)),
                                  ArrowButton(
                                    iconbutton: IconButton(
                                      icon: Icon(
                                        Icons.arrow_forward_ios,
                                        size: fontSize(17),
                                      ),
                                      onPressed: () {
                                        upToggle = true;

                                        toggleHeadline();

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
                                    child: Text(
                                      calenderChoices[arrowCount]['item1'] ?? 'null',
                                      style: const TextStyle(
                                          fontFamily: "Sans",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17.5,
                                          letterSpacing: 1.5,
                                          color: Colors.white70),
                                    ),
                                  )
                                ],
                              ),
                              RichText(
                                text: TextSpan(
                                    text: calenderChoices[arrowCount]['icon1'] ?? 'null', // emoji characters
                                    style: const TextStyle(
                                      fontFamily: 'EmojiOne',
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        questionChoices.add(calenderChoices[arrowCount]['item1']);
                                        questionChoice();
                                        //method giving data to calendar;
                                      }),
                              ),
                            ],
                          ),
                          const SizedBox(
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
                                    child: Text(
                                      calenderChoices[arrowCount]['item2'] ?? 'null',
                                      style: const TextStyle(
                                          fontFamily: "Sans",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17.5,
                                          letterSpacing: 1.5,
                                          color: Colors.white70),
                                    ),
                                  )
                                ],
                              ),
                              RichText(
                                text: TextSpan(
                                    text: calenderChoices[arrowCount]['icon2'] ?? 'null', // emoji characters
                                    style: const TextStyle(
                                      fontFamily: 'EmojiOne',
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        questionChoices.add(calenderChoices[arrowCount]['item2']);
                                        questionChoice();
                                        //method giving data to calendar;
                                      }),
                              ),
                            ],
                          ),
                          const SizedBox(
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
                                    child: Text(
                                      calenderChoices[arrowCount]['item3'] ?? 'null',
                                      style: const TextStyle(
                                          fontFamily: "Sans",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17.5,
                                          letterSpacing: 1.5,
                                          color: Colors.white70),
                                    ),
                                  ),
                                ],
                              ),
                              RichText(
                                text: TextSpan(
                                    text: calenderChoices[arrowCount]['icon3'] ?? 'null', // emoji characters
                                    style: const TextStyle(
                                      fontFamily: 'EmojiOne',
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        questionChoices.add(calenderChoices[arrowCount]['item3']);
                                        questionChoice();
                                        //method giving data to calendar;
                                      }),
                              ),
                            ],
                          ),
                          const SizedBox(
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
                                    child: Text(
                                      calenderChoices[arrowCount]['item4'] ?? 'null',
                                      style: const TextStyle(
                                          fontFamily: "Sans",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 17.5,
                                          letterSpacing: 1.5,
                                          color: Colors.white70),
                                    ),
                                  )
                                ],
                              ),
                              RichText(
                                text: TextSpan(
                                    text: calenderChoices[arrowCount]['icon4'] ?? 'null', // emoji characters
                                    style: const TextStyle(
                                      fontFamily: 'EmojiOne',
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        questionChoices.add(calenderChoices[arrowCount]['item4']);
                                        questionChoice();
                                        //method giving data to calendar;
                                      }),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
          ],
        ),
      ),
    );
  }

  void toggleHeadline() {
    setState(() {
      if (upToggle) {
        arrowCount++;

        if(arrowCount> calenderChoices.length-1)
        {
          arrowCount = 0;
        }
        upToggle = false;
      }
      else
      if (downToggle) {
        arrowCount--;

        if(arrowCount<0)
        {
          arrowCount = calenderChoices.length-1;
        }
        downToggle = false;
      }

    });
  }
  void questionChoice(){
    String questionChoiceString = questionChoices.last;
    itemSwitch = true;
    if (widget.itemSwitch){
      questionChoiceString = questionChoices.last;

    }
    else
    {

      questionChoiceString = "";
    }
    itemSwitch = false;
    //return  question_choice;
  }
}


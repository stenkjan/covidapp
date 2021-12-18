import 'package:covidapp/Mozido/content/size.dart';
import 'package:covidapp/Mozido/content/strings.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_sparkline/flutter_sparkline.dart';

import 'T2_calendar_form.dart';
import 'charts/arrow_button.dart';
import 'charts/colors.dart';

class T2Kalender extends StatefulWidget {
  final bool item_switch;
  final String question_choice;
  T2Kalender({Key? key, required this.item_switch, required this.question_choice}) : super(key: key);
  @override
  T2KalenderState createState() => T2KalenderState(item_switch: this.item_switch, question_choice: this.question_choice);
}

class T2KalenderState extends State<T2Kalender> {
  bool item_switch = false;
  String question_choice;
  T2KalenderState({required this.item_switch,required this.question_choice});
  @override
  void initState() {
    super.initState();
    toggleHeadline();
  }
  List <String> headline = const ["Zustand", "Haertefaelle", "Krankheitsgrad"];
  var question_choices = <String>[];
  int arrow_count = 0;
  bool up_toggle = false;
  bool down_toggle = false;


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
      backgroundColor: Color(0xFF313237),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 00.0,
            ),
            Container(
              height: 230.0,
              child: Expanded(
                child:T2_Calendar(),),),
            SizedBox(
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
                      height: 50.0,
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
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    calenderChoices[arrow_count]['name']!=null?calenderChoices[arrow_count]['name']:'null',
                                   // headline[arrow_up_count],
                                    style: TextStyle(
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
                            SizedBox(
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
                                        down_toggle = true;
                                        print(down_toggle);
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
                                        up_toggle = true;
                                        print(up_toggle);
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
            Container(
            child: Padding(
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
                              calenderChoices[arrow_count]['item1']!=null?calenderChoices[arrow_count]['item1']:'null',
                              style: TextStyle(
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
                          text: calenderChoices[arrow_count]['icon1']!=null?calenderChoices[arrow_count]['icon1']:'null', // emoji characters
                          style: TextStyle(
                            fontFamily: 'EmojiOne',
                          ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                            question_choices.add(calenderChoices[arrow_count]['item1']);
                            questionChoice();
                                //method giving data to calendar;
                              }),
                      ),
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
                            child: Text(
                              calenderChoices[arrow_count]['item2']!=null?calenderChoices[arrow_count]['item2']:'null',
                              style: TextStyle(
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
                          text: calenderChoices[arrow_count]['icon2']!=null?calenderChoices[arrow_count]['icon2']:'null', // emoji characters
                          style: TextStyle(
                            fontFamily: 'EmojiOne',
                          ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                question_choices.add(calenderChoices[arrow_count]['item2']);
                                questionChoice();
                                //method giving data to calendar;
                              }),
                      ),
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
                            child: Text(
                              calenderChoices[arrow_count]['item3']!=null?calenderChoices[arrow_count]['item3']:'null',
                              style: TextStyle(
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
                          text: calenderChoices[arrow_count]['icon3']!=null?calenderChoices[arrow_count]['icon3']:'null', // emoji characters
                          style: TextStyle(
                            fontFamily: 'EmojiOne',
                          ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                question_choices.add(calenderChoices[arrow_count]['item3']);
                                questionChoice();
                                //method giving data to calendar;
                              }),
                      ),
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
                            child: Text(
                              calenderChoices[arrow_count]['item4']!=null?calenderChoices[arrow_count]['item4']:'null',
                              style: TextStyle(
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
                          text: calenderChoices[arrow_count]['icon4']!=null?calenderChoices[arrow_count]['icon4']:'null', // emoji characters
                          style: TextStyle(
                            fontFamily: 'EmojiOne',
                          ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                question_choices.add(calenderChoices[arrow_count]['item4']);
                                questionChoice();
                                //method giving data to calendar;
                              }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
          ],
        ),
      ),
    );
  }

  void toggleHeadline() {
    setState(() {
      if (up_toggle) {
        arrow_count++;

        if(arrow_count> calenderChoices.length-1)
          {
            arrow_count = 0;
          }
        up_toggle = false;
      }
      else
      if (down_toggle) {
        arrow_count--;

        if(arrow_count<0)
        {
          arrow_count = calenderChoices.length-1;
        }
        down_toggle = false;
      }
    print(arrow_count);
    });
  }
  void questionChoice(){
    String question_choice = question_choices.last;
    item_switch = true;
    if (widget.item_switch){
      question_choice = question_choices.last;

    }
    else
      {
        print("No Item selected");
        question_choice = "";
      }
    item_switch = false;
    //return  question_choice;
  }
}


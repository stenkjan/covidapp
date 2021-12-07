import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

import 'T2_calendar_form.dart';

class T2_kalender extends StatefulWidget {
  T2_kalender({Key? key}) : super(key: key);

  _T2_kalenderState createState() => _T2_kalenderState();
}

class _T2_kalenderState extends State<T2_kalender> {
  @override

  ///
  /// Data for grafik line
  ///
  var _data = [
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
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF313237),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 00.0,
            ),

            ///
            /// Grafik
            ///
            Container(
              height: 230.0,
              child: T2_Calendar(),),
            SizedBox(
              height: 30.0,
            ),

            ///
            /// Card under grafic line
            ///
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
                                  Text(
                                    "Zustand",
                                    style: TextStyle(
                                        fontFamily: "Sans",
                                        fontSize: 24.0,
                                        color: Colors.white70),
                                  ),
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
                                    child: Text(
                                      "Ausgezeichnet",
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
                                  text: '😍️\u200d', // emoji characters
                                  style: TextStyle(
                                    fontFamily: 'EmojiOne',
                                  ),
                                ),
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
                                      "Gut",
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
                              text: '☺\u200d', // emoji characters
                              style: TextStyle(
                                fontFamily: 'EmojiOne',
                              ),
                        ),
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
                                      "Neutral",
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
                                  text: '😐️\u200d', // emoji characters
                                  style: TextStyle(
                                    fontFamily: 'EmojiOne',
                                  ),
                                ),
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
                                      "Schlecht",
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
                                  text: '😧\u200d', // emoji characters
                                  style: TextStyle(
                                    fontFamily: 'EmojiOne',
                                  ),
                                ),
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
            SizedBox(
              height: 30.0,
            ),
          ],
        ),
      ),
    );
  }
}
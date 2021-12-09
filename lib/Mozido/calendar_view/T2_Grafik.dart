import 'package:covidapp/Mozido/calendar_view/charts/pie_chart.dart';
import 'package:covidapp/Mozido/content/size.dart';
import 'package:covidapp/Mozido/content/strings.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:flutter_sparkline/flutter_sparkline.dart';

import 'charts/arrow_button.dart';
import 'charts/colors.dart';

class T2Grafik extends StatefulWidget {
  T2Grafik({Key? key}) : super(key: key);

  T2GrafikState createState() => T2GrafikState();
}

class T2GrafikState extends State<T2Grafik> {
  @override

  ///
  /// Data for grafik line
  ///
  Widget build(BuildContext context) {
    double fontSize(double size) {
      return size * SizeConfig.getWidth(context) / 414;
    }


    /// Calculates number of weeks for a given year as per https://en.wikipedia.org/wiki/ISO_week_date#Weeks_per_year

    DateTime year = DateTime(DateTime.now().year);
    int numOfWeeks(int year) {
      DateTime dec28 = DateTime(year, 12, 28);
      int dayOfDec28 = int.parse(DateFormat("D").format(dec28));
      return ((dayOfDec28 - dec28.weekday + 10) / 7).floor();
    }

    /// Calculates week number from a date as per https://en.wikipedia.org/wiki/ISO_week_date#Calculation

    int weekNumber(DateTime date) {
      int dayOfYear = int.parse(DateFormat("D").format(date));
      int woy =  ((dayOfYear - date.weekday + 10) / 7).floor();
      if (woy < 1) {
        woy = numOfWeeks(date.year - 1);
      } else if (woy > numOfWeeks(date.year)) {
        woy = 1;
      }
      return woy;
    }


    return Container(

       child: Column(
            children: [
              SingleChildScrollView(
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: SizeConfig.getHeight(context) / 14,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            height: 40,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: Colors.white70,
                                  

                                  borderRadius: BorderRadius.circular(20),
                                boxShadow: [
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
                              "Woche" + " X ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: fontSize(25),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )),
                      Container(
                        width: SizeConfig.getWidth(context) / 3.7,
                        margin: EdgeInsets.only(
                            right: SizeConfig.getWidth(context) / 30),
                        child: Row(
                          children: <Widget>[
                            ArrowButton(
                              iconbutton: IconButton(
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  size: fontSize(17),
                                ),
                                onPressed: () {},
                              ),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 6),
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
                                onPressed: () {},
                              ),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: healthscore.map((data) {
                              return Container(
                            padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Row(
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      width: 10,
                                      height: 10,
                                      decoration: BoxDecoration(
                                          color: AppColors
                                              .pieColors[healthscore.indexOf(data)],
                                          shape: BoxShape.circle),
                                    ),
                                    Text(
                                      data['name'],
                                      style: TextStyle(
                                        fontSize: fontSize(16),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 120.0,

                      ),
                          Container(
                            margin: EdgeInsets.only(right: 5.0),
                            height: SizeConfig.getHeight(context) / 9,
                              child: PieChart(),
                            ),



                      ],
                    ),
                    ),
                      ],
          ),
    ),
        ],

      ),

      /*new Sparkline(
                        data: _data,
                        lineWidth: 0.3,
                        fillMode: FillMode.below,
                        lineColor: Colors.lightBlueAccent,
                        fillGradient: new LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF31A1C9).withOpacity(0.7),
                            Colors.blue.withOpacity(0.01)
                          ],
                        ),
                      ),*/
    );
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

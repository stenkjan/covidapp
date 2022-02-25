import 'package:covidapp/Mozido/calendar_view/grafik.dart';
import 'package:covidapp/Mozido/calendar_view/calendar.dart';
import 'package:covidapp/Mozido/calendar_view/widgets/daily_pie.dart';
import 'package:covidapp/Mozido/calendar_view/widgets/heart_graph.dart';
import 'package:covidapp/Mozido/calendar_view/widgets/pie_chart.dart';
import 'package:covidapp/Mozido/calendar_view/widgets/weekly_graph.dart';
import 'package:covidapp/Mozido/content/calendar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../content/size.dart';

class GrafikTabBar extends StatefulWidget {
  const GrafikTabBar({Key? key}) : super(key: key);

  @override
  _GrafikTabBarState createState() => _GrafikTabBarState();
}

class _GrafikTabBarState extends State<GrafikTabBar> {
  late bool itemSwitch;
  late String questionChoice;
  late CalendarContent calContent;
  @override
  void initState() {
    questionChoice = "";
    itemSwitch = false;
    calContent = CalendarContent();
    calContent.pieLegendbool = true;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CalendarContent calContent = Provider.of<CalendarContent>(context);
    return Container(
      height: 420,
      width: 400,
      /* decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0)),
        gradient: LinearGradient(
          colors: [Color(0xFF31A1C9), Color.fromARGB(255, 6, 84, 104)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ), /* 
      child: Scaffold(
        backgroundColor: const Color(0xFF313237), */
      ),
 */
      ///z

      /// Custom tab bar
      ///
      child: Column(
        children: [
          Expanded(
            child: DefaultTabController(
              length: 3,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: PreferredSize(
                  preferredSize:
                      const Size.fromHeight(35.0), // here the desired height
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
                        indicatorPadding: EdgeInsets.zero,
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
                            child: Text(
                              "Tag",
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Tab(
                              child: Text(
                            "Woche",
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w300,
                            ),
                          )),
                          Tab(
                              child: Text(
                            "BPM",
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w300,
                            ),
                          )),
                        ],
                      ),
                    ),
                  ),
                ),

                ///
                /// Body tabBar
                ///
                body: TabBarView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 5.0,
                        right: 5.0,
                      ),
                      child: DayPie(),
                      //PieChartNew(
                      //calContent.dataMap,
                      //),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 5.0,
                        right: 5.0,
                      ),
                      child: WeekGraph(),
                      //PieChartNew(
                      //calContent.dataMap,
                      //),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 5.0,
                        right: 5.0,
                      ),
                      child: HeartGraph(),
                    /*  Padding(
                      padding: const EdgeInsets.only(
                        left: 5.0,
                        right: 5.0,
                      ),
                      child: Container(
                        width: SizeConfig.getWidth(context),
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Colors.blue[900]!.withOpacity(0.1),
                              blurRadius: 50,
                              spreadRadius: 40,
                              offset: const Offset(40, 0)),
                          const BoxShadow(
                              color: Colors.white12,
                              blurRadius: 30,
                              spreadRadius: 20,
                              offset: Offset(20, 0)),
                        ], shape: BoxShape.circle, color: Colors.white30),
                        margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.getWidth(context) / 50,
                            vertical: SizeConfig.getHeight(context) / 100),
                        child: Stack(
                          children: <Widget>[
                            Positioned.fill(
                              top: 150,
                              bottom: -100,
                              left: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: const Color(0xFF31A1C9)
                                              .withOpacity(0.6),
                                          blurRadius: 50,
                                          spreadRadius: 20,
                                          offset: const Offset(20, 0)),
                                      const BoxShadow(
                                          color: Colors.white12,
                                          blurRadius: 50,
                                          spreadRadius: 20,
                                          offset: Offset(0, 0)),
                                    ],
                                    shape: BoxShape.circle,
                                    color: Colors.white30),
                              ),
                            ),
                            Positioned.fill(
                              top: -100,
                              bottom: -100,
                              left: -300,
                              child: Container(
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: const Color(0xFF31A1C9)
                                              .withOpacity(0.2),
                                          blurRadius: 300,
                                          spreadRadius: 40,
                                          offset: const Offset(10, 0)),
                                      const BoxShadow(
                                          color: Color(0xFF31A1C9),
                                          blurRadius: 150,
                                          spreadRadius: 80,
                                          offset: Offset(20, 0)),
                                    ],
                                    shape: BoxShape.circle,
                                    color: Colors.white30),
                              ),
                            ),

                            //FormDesignScrollView(),

                            PieChart(
                              grafikData: calContent.getCalendarList(),
                            ),
                            //FormDesignScrollView(),
                          ],
                        ),
                      ),
                    ), */
                    //tab3 design
                  /*   Padding(
                      padding: const EdgeInsets.only(
                          left: 5.0, right: 5.0, top: 5.0),
                      child: Container(
                        width: SizeConfig.getWidth(context),
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Colors.blue[900]!.withOpacity(0.1),
                              blurRadius: 50,
                              spreadRadius: 40,
                              offset: const Offset(40, 0)),
                          const BoxShadow(
                              color: Colors.white12,
                              blurRadius: 30,
                              spreadRadius: 20,
                              offset: Offset(20, 0)),
                        ], shape: BoxShape.circle, color: Colors.white30),
                        margin: EdgeInsets.symmetric(
                            horizontal: SizeConfig.getWidth(context) / 50,
                            vertical: SizeConfig.getHeight(context) / 100),
                        child: Stack(
                          children: <Widget>[
                            Positioned.fill(
                              top: 150,
                              bottom: -100,
                              left: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: const Color(0xFF31A1C9)
                                              .withOpacity(0.6),
                                          blurRadius: 50,
                                          spreadRadius: 20,
                                          offset: const Offset(20, 0)),
                                      const BoxShadow(
                                          color: Colors.white12,
                                          blurRadius: 50,
                                          spreadRadius: 20,
                                          offset: Offset(0, 0)),
                                    ],
                                    shape: BoxShape.circle,
                                    color: Colors.white30),
                              ),
                            ),
                            Positioned.fill(
                              top: -100,
                              bottom: -100,
                              left: -300,
                              child: Container(
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: const Color(0xFF31A1C9)
                                              .withOpacity(0.2),
                                          blurRadius: 300,
                                          spreadRadius: 40,
                                          offset: const Offset(10, 0)),
                                      const BoxShadow(
                                          color: Color(0xFF31A1C9),
                                          blurRadius: 150,
                                          spreadRadius: 80,
                                          offset: Offset(20, 0)),
                                    ],
                                    shape: BoxShape.circle,
                                    color: Colors.white30),
                              ),
                            ), */

                            //FormDesignScrollView(),


                            //FormDesignScrollView(),
                          
                        ),
                  ],
                      ),
                    ),
            ),
          ),
                  ],
                ),
              );
  }
}

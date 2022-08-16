import 'package:covidapp/covidapp/calendar_view/widgets/daily_pie.dart';
import 'package:covidapp/covidapp/calendar_view/widgets/heart_graph.dart';
import 'package:covidapp/covidapp/calendar_view/widgets/weekly_graph.dart';
import 'package:covidapp/covidapp/content/calendar_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GrafikTabBar extends StatefulWidget {
  const GrafikTabBar({Key? key}) : super(key: key);

  @override
  GrafikTabBarState createState() => GrafikTabBarState();
}

class GrafikTabBarState extends State<GrafikTabBar> {
  late bool itemSwitch;
  late String questionChoice;

  @override
  void initState() {
    questionChoice = "";
    itemSwitch = false;

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final calContent = Provider.of<CalendarContent>(context);

    calContent.pieLegendbool = true;
    return SizedBox(
      height: 420,
      width: 400,

      ///
      /// Custom tab bar for Grafik DayPie() WeekGraph() and HeartGraph()
      ///
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
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
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                    border: Border.all(color: Colors.black54),
                    color: Colors.black26),
                child: TabBar(
                  indicatorPadding: EdgeInsets.zero,
                  indicatorColor: const Color(0xFF31A1C9),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white54,
                  indicator: ShapeDecoration.fromBoxDecoration(
                      const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
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
          body: const SizedBox(
            height: 400,
            width: 400,
            child: TabBarView(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 5.0,
                    right: 5.0,
                  ),
                  child: DayPie(),
                  //PieChartNew(
                  //calContent.dataMap,
                  //),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 5.0,
                    right: 5.0,
                  ),
                  child: WeekGraph(),
                  //PieChartNew(
                  //calContent.dataMap,
                  //),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 5.0,
                    right: 5.0,
                  ),
                  child: HeartGraph(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

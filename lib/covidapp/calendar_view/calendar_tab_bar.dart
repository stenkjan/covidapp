import 'package:covidapp/covidapp/calendar_view/grafik.dart';
import 'package:covidapp/covidapp/calendar_view/calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalendarTabBar extends StatefulWidget {
  const CalendarTabBar({Key? key}) : super(key: key);

  @override
  _CalendarTabBarState createState() => _CalendarTabBarState();
}

class _CalendarTabBarState extends State<CalendarTabBar> {
  bool itemSwitch = false;
  String questionChoice = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF313237),

      ///z
      /// Appbar
      ///
      appBar: AppBar(
        title: const Text(
          "Kalender/ Entwicklung",
          style: TextStyle(
              color: Colors.white, fontFamily: "Popins", fontSize: 18.0),
        ),
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: const Color(0xFF313237),
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.lightBlue),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 5.0,
          ),

          ///
          /// Custom tab bar
          ///
          Expanded(
            child: DefaultTabController(
              length: 2,
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
                            child: Text(
                              "Kalender",
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          Tab(
                              child: Text(
                            "Grafik",
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
                body: const TabBarView(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                      child: Calendar(),
                    ),
                   
                    Padding(
                      padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                      child: T2Grafik(),
                    ),
                
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
    /*  ),
          ),
        ],
      ),
    ); */
  }
}

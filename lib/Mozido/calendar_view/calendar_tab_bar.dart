import 'package:covidapp/Mozido/calendar_view/grafik.dart';
import 'package:covidapp/Mozido/calendar_view/calendar.dart';
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
                    /*  Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0)),
                      ),
                      child: Padding(
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
                              ),
 */
                    //FormDesignScrollView(),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                      child: T2Grafik(),
                    ),
                    //FormDesignScrollView(),
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

import 'package:covidapp/covidapp/calendar_view/grafik.dart';
import 'package:covidapp/covidapp/calendar_view/calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../content/calendar_content.dart';
import '../services/calendar_service.dart';

class CalendarTabBar extends StatefulWidget {
  const CalendarTabBar({Key? key}) : super(key: key);

  @override
  CalendarTabBarState createState() => CalendarTabBarState();
}

class CalendarTabBarState extends State<CalendarTabBar> {
  late bool itemSwitch;
  String questionChoice = "";
  bool showInformation = false;
  late double floatingOpacity;
  @override
  void initState() {
    itemSwitch = false;
    showInformation = false;
    floatingOpacity = 0;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final calContent = Provider.of<CalendarContent>(context);
    final calService = Provider.of<CalendarService>(context);
    floatingOpacity = calContent.count.toDouble();
    return Scaffold(
      backgroundColor: const Color(0xFF313237),

      ///z
      /// Appbar for Calendar and Grafik
      ///
      appBar: AppBar(
        title: const Text(
          "Symptome",
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
                          onTap: (int i) {
                            if (showInformation == false) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return SizedBox(
                                      height: 600,
                                      width: 400,
                                      child: AlertDialog(
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0))),
                                        backgroundColor: Colors.black12,
                                        title: const Text("Anleitung"),
                                        content: Builder(
                                          builder: (context) {
                                            // Get available height and width of the build area of this widget. Make a choice depending on the size.
                                            var height = MediaQuery.of(context)
                                                .size
                                                .height;
                                            var width = MediaQuery.of(context)
                                                .size
                                                .width;
                                            return SizedBox(
                                              height: height - 50,
                                              width: width - 25,
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width: 200,
                                                    height: 300,
                                                    alignment: Alignment.center,
                                                    decoration:
                                                        const BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        10.0)),
                                                            color: Color(
                                                                0xFF363940),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Colors
                                                                    .black12,
                                                                blurRadius:
                                                                    10.0,
                                                                spreadRadius:
                                                                    2.0,
                                                              ),
                                                            ],
                                                            image:
                                                                DecorationImage(
                                                                    image:
                                                                        AssetImage(
                                                                      "images/grafik_helper_image.png",
                                                                    ),
                                                                    fit: BoxFit
                                                                        .cover)),
                                                  ),
                                                  const Expanded(
                                                    child:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      child: SizedBox(
                                                        width: 350,
                                                        child: Text("""
                                                                                          In der Grafik finden Sie oben links den aktuellen Tag, mit den Pfeilen können Sie vergangene Tage anzeigen. Darunter befindet sich eine Auflistung der Symptome und links davon die dazugehörige Farbe. Rechts davon wird der aktuelle Wert der Symptome je Tag angezeigt, wobei 10-1000 für leichte-schwere Symptome steht. Unterhalb können Sie mit einem Klick auf die Wörter Tag, Woche und BPM zwischen den verschiedenen grafischen Darstellungen der Symptome wechseln""",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                            )),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                        actions: [
                                          Stack(
                                            children: [
                                              Container(
                                                margin: const EdgeInsets.only(
                                                  left: 10,
                                                  top: 3,
                                                ),
                                                alignment: Alignment.bottomLeft,
                                                child: TextButton(
                                                  child: const Text(
                                                    "Verstanden",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontFamily: "sans",
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  onPressed: () =>
                                                      Navigator.pop(context),
                                                ),
                                              ),
                                              Container(
                                                margin: const EdgeInsets.only(
                                                  left: 10,
                                                  top: 3,
                                                ),
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: TextButton(
                                                    child: const Text(
                                                      "Ausblenden",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        fontFamily: "sans",
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        showInformation = true;
                                                      });

                                                      Navigator.pop(context);
                                                    }),
                                              ),
                                              /*  Container(
                                                width: 50,
                                                height: 25,
                                                alignment: Alignment.bottomLeft,
                                                margin: const EdgeInsets.only(
                                                  bottom: 30,
                                                ),
                                                child: CheckboxListTile(
                                                  checkColor: Colors.white,
                                                  checkboxShape:
                                                      const CircleBorder(),
                                                  enableFeedback: true,
                                                  title: const Text(
                                                    "Ausblenden",
                                                    textAlign: TextAlign.end,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: "sans",
                                                    ),
                                                  ), //    <-- label
                                                  value: showInformation,
                                                  onChanged: (bool? newValue) {
                                                    setState(() {
                                                      showInformation =
                                                          newValue!;
                                                    });
                                                  },
                                                ),
                                              ), */
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            }
                          }),
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
                      child: SizedBox(width: 370, child: Calendar()),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                      child: Grafik(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Opacity(
        opacity: floatingOpacity,
        child: FloatingActionButton.extended(
          onPressed: () {
            setState(() {
              floatingOpacity = 0;

              /*  if (calContent.docExists == false) { */
              calService.dailyTask(
                  calContent.mood,
                  calContent.muedigkeit,
                  calContent.atemnot,
                  calContent.sinne,
                  calContent.herz,
                  calContent.schlaf,
                  calContent.nerven,
                  calContent.comment,
                  calContent.currentDate);
              calContent.clear();
              /*  } */
            });
          },
          tooltip: "Bestätigen",
          foregroundColor: const Color(0xFF31A1C9),
          backgroundColor: const Color(0xFF31A1C9),
          label: const Text(
            "Speichern",
            style: TextStyle(color: Colors.white),
          ),
          icon: const Icon(
            Icons.save_alt,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

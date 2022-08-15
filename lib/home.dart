// ignore_for_file: avoid_print

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:covidapp/covidapp/webview/main_web_view.dart';
import 'package:covidapp/faq.dart';
import 'package:covidapp/covidapp/calendar_view/lrm_data_model.dart';
import 'package:covidapp/covidapp/content/calendar_content.dart';
import 'package:covidapp/covidapp/services/auth_service.dart';
import 'package:covidapp/covidapp/services/db_service.dart';
import 'package:covidapp/covidapp/uebungen/uebungen.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';
import 'covidapp/calendar_view/calendar_tab_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  late DatabaseService dbService;
  late AuthService authService;
  late CalendarContent cal;
  late Icon iconbreathe;
  late Icon iconpulse;
  late Icon iconcal;
  static late String breatheMin;
  static late String lastBPM;
  static late String calAct;

  @override
  void initState() {
    authService = AuthService();
    dbService = DatabaseService(uid: authService.getUser());
    cal = CalendarContent();

    breatheMin = cal.returnBreatheMin();
    if (breatheMin != "0") {
      cal.returnBreatheTrue();
    } else {
      cal.returnbreatheFalse();
    }

    if (cal.returnbpmDay()[cal.currentDate] != 0) {
      cal.returnPulseTrue();
    }
    lastBPM = cal.getlastBPM();
    calAct = cal.getcalAnswer();

    if ((!calAct.isEmpty) && (calAct != "0")) {
      cal.returnCalTrue();
    }
    if (cal.returncalSumL()[cal.currentDate] != 0) {
      cal.returnCalTrue();
    }
    iconbreathe = cal.getbreatheTrue();
    iconpulse = cal.getpulseTrue();
    iconcal = cal.getcalendarTrue();
    super.initState();

    /* if (Credentials.signed_in = false) {
      SignInScreen();
    } else {
      SignInScreen();
    } */
  }

  @override
  void dispose() {
    super.dispose();
  }

  final GlobalKey<ScaffoldState> _scaffoldKeyHome =
      GlobalKey<ScaffoldState>(debugLabel: "homeKey");

  @override
  Widget build(BuildContext context) {
    CalendarContent calContent = Provider.of<CalendarContent>(context);

    calContent.returnSickDays();
    /*
    if (Credentials.signed_in = false) {
    return SignInScreen();
*/
    return Scaffold(
      key: _scaffoldKeyHome,

      backgroundColor: const Color(0xFF313237),

      ///
      /// Drawer layout
      ///
      drawer: const DrawerLayout(),
      body: Stack(
        children: <Widget>[
          //Login zwischenschieben

          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ///
                /// Image slider top
                ///
                Padding(
                  padding: const EdgeInsets.only(top: 105.0),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 5 / 10,
                      autoPlay: false,
                      autoPlayInterval: const Duration(seconds: 2000),
                      viewportFraction: 1.0,
                      height: 220.0,
                    ),
                    items: [0, 1, 2, 3, 4].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: _cardHeader(listLrm[i]),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 5.0, bottom: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        "Erfolge",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            fontFamily: "Sans",
                            fontSize: 17.0),
                      ),
                      IconButton(
                        tooltip: "Check",
                        focusColor: Colors.lightGreen,
                        icon: calContent.getallTrue(),
                        onPressed: () {
                          setState(() {
                            print("${cal.breatheTrue} breathe");
                            iconbreathe = cal.getbreatheTrue();
                            breatheMin = cal.returnBreatheMin();
                            if (breatheMin != "0") {
                              cal.returnBreatheTrue();
                            } else {
                              cal.returnbreatheFalse();
                            }
                            calAct = calContent.getcalAnswer();
                            if (calAct != "0") {
                              calContent.returnCalTrue();
                            }
                            iconcal = cal.getcalendarTrue();

                            if (calContent
                                    .returnbpmDay()[calContent.currentDate] !=
                                0) {
                              lastBPM = calContent.getlastBPM();
                              calContent.returnPulseTrue();
                              iconpulse = cal.getpulseTrue();
                            }
                            calContent.returnSickDays();
                          });
                        },
                      ),
                    ],
                  ),
                ),

                ///
                /// Card
                ///

                _card(
                    Colors.lightBlueAccent,
                    "$breatheMin Sekunden Atemübungen",
                    dbService.calContent.fullDate,
                    "Fortschritt",
                    iconbreathe),
                _card(Colors.yellowAccent, "Tägliche Pulsmessung: $lastBPM",
                    dbService.calContent.fullDate, "Fortschritt", iconpulse),
                _card(Colors.lightGreenAccent, "Kalenderaktivitäten: $calAct",
                    dbService.calContent.fullDate, "Fortschritt", iconcal),

                const SizedBox(
                  height: 20.0,
                )
              ],
            ),
          ),

          ///
          /// Appbar Custom
          ///
          Container(
            color: const Color(0xFF313237),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 43.0, left: 20.0, right: 20.0, bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: InkWell(
                        onTap: () {
                          _scaffoldKeyHome.currentState?.openDrawer();
                        },
                        child: Image.asset("images/tabBar.png")),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0, left: 10.0),
                    child: Text(
                      "Long Covid App",
                      style: TextStyle(
                          fontFamily: "Sofia",
                          color: Colors.white,
                          fontSize: 20.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Container(
                      height: 35.0,
                      width: 35.0,
                      decoration: const BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                  "https://media3.giphy.com/media/l1J9LxVGTBa8DS3pC/giphy.gif?cid=ecf05e47twt83mqy00z2hsz5mq2tnomover36jzi4zz9bmzm&rid=giphy.gif&ct=g"),
                              fit: BoxFit.cover)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Card for Archievements initialization */

Widget _card(Color color, String title, String time, String value, Icon icon) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
    child: Container(
      height: 120.0,
      width: double.infinity,
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
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        height: 8.0,
                        width: 8.0,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20.0)),
                            color: color),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontFamily: "Sans",
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0),
                        ),
                      ),
                    ],
                  ),
                  /*      const Icon(
                    Icons.open_in_new,
                    size: 17.0,
                    color: Colors.white24,
                  ) */
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 45.0, right: 20.0, top: 13.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    time,
                    style: const TextStyle(
                        fontFamily: "Sans",
                        fontWeight: FontWeight.w100,
                        color: Colors.white54),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        value,
                        style: const TextStyle(
                            fontFamily: "Sans",
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 19.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: icon,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

///
/// Layout for drawer
///
class DrawerLayout extends StatelessWidget {
  const DrawerLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Drawer(
        child: Container(
      color: const Color(0xFF29303C),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 250.0,
                width: 250.0,
                decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(350.0)),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      tileMode: TileMode.repeated,
                      colors: [Color(0xFF15EDED), Color(0xFF029CF5)]),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 70.0, left: 20.0),
                child: Text(
                  "ÜBERSICHT",
                  style: TextStyle(
                    fontFamily: "Lemon",
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Flexible(
            child: ListView(
              children: <Widget>[
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const Home()));
                    },
                    child: itemDrawer(Icons.home, "ÜBERSICHT")),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const FAQ()));
                    },
                    child: itemDrawer(Icons.search, "FAQ")),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const Uebungen()));
                    },
                    child: itemDrawer(Icons.style, "ÜBUNGEN")),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const CalendarTabBar()));
                    },
                    child: itemDrawer(Icons.calendar_today, "KALENDER")),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const WebMain()));
                    },
                    child: itemDrawer(Icons.calendar_today, "WEB")),
                const SizedBox(
                  height: 17.0,
                ),
                Neumorphic(
                  margin: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  style: NeumorphicStyle(
                      shape: NeumorphicShape.convex,
                      border: const NeumorphicBorder(
                        color: Color.fromARGB(157, 87, 86, 86),
                        width: 2.5,
                      ),
                      boxShape: NeumorphicBoxShape.roundRect(
                          const BorderRadius.horizontal(
                              left: Radius.circular(50),
                              right: Radius.circular(50))),
                      depth: 10,
                      intensity: 4.0,
                      shadowLightColor: const Color.fromARGB(255, 0, 0, 0),
                      lightSource: LightSource.topLeft,
                      color: Colors.transparent),
                ),
                const SizedBox(
                  height: 2.0,
                ),
                Neumorphic(
                  margin: const EdgeInsets.all(20),
                  curve: Curves.easeIn,
                  style: NeumorphicStyle(
                      shape: NeumorphicShape.convex,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(50)),
                      depth: 5,
                      intensity: 2.0,
                      shadowLightColor: const Color.fromARGB(108, 0, 0, 0),
                      /*  lightSource: LightSource.topLeft, */
                      color: const Color.fromARGB(255, 46, 155, 244)),
                  child: SizedBox(
                    height: 35,
                    width: 140,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.logout_rounded,
                          color: Colors.white54),
                      label: const Text("Ausloggen"),
                      onPressed: () async {
                        await authService.signOut();
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Sie haben sich abgemeldet"),
                        ));
                        await authService.signOut();
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 3.0,
                ),
              ],
            ),
          ),
//
        ],
      ),
    ));
  }
}

Widget line(double width) {
  return Container(
    height: 0.5,
    width: width,
    color: const Color(0xFF86CBF9).withOpacity(0.6),
  );
}

///
/// item widget for drawer
///
Widget itemDrawer(IconData icon, String txt) {
  return Neumorphic(
    margin: const EdgeInsets.only(top: 5, bottom: 2.5, left: 20, right: 20),
    style: const NeumorphicStyle(
        shape: NeumorphicShape.convex,
        depth: 2,
        intensity: 1.0,
        shadowLightColor: Colors.transparent,
        shadowDarkColor: Colors.black26,
        /*  lightSource: LightSource.topLeft, */
        color: Colors.transparent),
    child: Padding(
      padding: const EdgeInsets.only(top: 5.0, left: 20.0, bottom: 5),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            size: 25.0,
            color: Colors.lightBlue,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  txt,
                  style: const TextStyle(
                    letterSpacing: 3.0,
                    color: Colors.white70,
                    fontSize: 20.0,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 4.0,
                        color: Color.fromARGB(124, 184, 184, 185),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}

/// Widget build Card Header  */
Widget _cardHeader(LrmDataModel item) {
  final AuthService auth = AuthService();
  final DatabaseService dbService = DatabaseService(uid: auth.getUser());
  CalendarContent calContent = CalendarContent();

  dbService.readcalendarCollection();
  return Stack(
    children: <Widget>[
      Container(
        height: 220.0,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF31A1C9), Color(0xFF3DB6D4)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    auth.getName(),
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontFamily: "Sans",
                        fontSize: 20.0),
                  ),
                  const Icon(Icons.coronavirus)
                ],
              ),
              const SizedBox(
                height: 60.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    /* dbService.registeredDate.toString() */
                    calContent.getsickDays(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w100,
                        fontFamily: "Sans",
                        fontSize: 20.0),
                  ),
                ],
              ),
              const SizedBox(
                height: 5.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    "Erkrankungstage",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w200,
                      fontFamily: "Sans",
                      fontSize: 16.0,
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      const Text(
                        "Datum",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontFamily: "Sans",
                        ),
                      ),
                      Text(
                        dbService.calContent.fullDate,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Sans",
                            fontSize: 16.0),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      Align(
        alignment: Alignment.topRight,
        child: Container(
          height: 170.0,
          width: 170.0,
          decoration: BoxDecoration(
              color: Colors.white10.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(200.0),
                  topRight: Radius.circular(20.0))),
        ),
      ),
    ],
  );
}

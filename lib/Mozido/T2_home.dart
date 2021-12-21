import 'package:carousel_slider/carousel_slider.dart';
import 'package:covidapp/Mozido/calendar_view/Lrm_dataModel.dart';
import 'package:covidapp/Mozido/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'T2_Amount.dart';
import 'T2_Investment.dart';
import 'T2_Search.dart';
import 'login/sign_in/components/credentials.dart';
import 'login/sign_in/signin.dart';

class T2_home extends StatefulWidget {
  T2_home({Key? key}) : super(key: key);

  @override
  _T2_homeState createState() => _T2_homeState();
}

class _T2_homeState extends State<T2_home> {

  @override
  void initState() {
    super.initState();
    if (Credentials.signed_in = false) {
      SignInScreen();
    }
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {


    return Scaffold(
      key: _scaffoldKey,

      backgroundColor: const Color(0xFF313237),

      ///
      /// Drawer layout
      ///
      drawer: DrawerLayout(),
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
                      autoPlayInterval: const Duration(seconds: 2000) ,
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
                      left: 20.0, right: 20.0, top: 20.0, bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Erfolge",
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            fontFamily: "Sans",
                            fontSize: 17.0),
                      ),
                      Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),

                ///
                /// Card
                ///
                _card(Colors.lightBlueAccent, "10 Atemübungen", "24/7/2021",
                    "Fortschritt"),
                _card(Colors.yellowAccent, "Tägliche Pulsmessung", "25/7/2021",
                    "Fortschritt"),
                _card(Colors.lightGreenAccent, "I am Happy", "25/7/2021",
                    "Fortschritt"),
                _card(Colors.lightBlueAccent, "20 Atemübungen", "26/7/2021",
                    "Fortschritt"),
                _card(Colors.lightBlueAccent, "30 Atemübungen", "28/7/2021",
                    "Fortschritt"),

                SizedBox(
                  height: 20.0,
                )
              ],
            ),
          ),

          ///
          /// Appbar Custom
          ///
          Container(
            color: Color(0xFF313237),
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
                          _scaffoldKey.currentState!.openDrawer();
                          //Scaffold.of(this.context).openDrawer();
                        },
                        child: Image.asset(
                            "lib/Mozido/Assets/tabBar.png")),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 10.0),
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
                      decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          image: DecorationImage(
                              image: NetworkImage(
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

  Widget _card(Color _color, String _title, String _time, String _value) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 19.0),
      child: Container(
        height: 120.0,
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
                                  BorderRadius.all(Radius.circular(20.0)),
                              color: _color),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            _title,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Sans",
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0),
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.open_in_new,
                      size: 17.0,
                      color: Colors.white24,
                    )
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
                      _time,
                      style: TextStyle(
                          fontFamily: "Sans",
                          fontWeight: FontWeight.w100,
                          color: Colors.white54),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          _value,
                          style: TextStyle(
                              fontFamily: "Sans",
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 19.0),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Icon(
                            Icons.check_circle,
                            size: 17.0,
                            color: Colors.lightGreen,
                          ),
                        )
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
}

///
/// Layout for drawer
///
class DrawerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(

        child: Container(
      color: Color(0xFF29303C),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 250.0,
                width: 250.0,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(350.0)),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      tileMode: TileMode.repeated,
                      colors: [Color(0xFF15EDED), Color(0xFF029CF5)]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70.0, left: 20.0),
                child: Text(
                  "Übersicht",
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
            child: new ListView(
              children: <Widget>[
                InkWell(
                    onTap: () {
                   //   Navigator.of(context).push(PageRouteBuilder(
                        //  pageBuilder: (_, __, ___) => new T2_Search()));
                    },
                    child: itemDrawer(Icons.search, "Zustand")),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder: (_, __, ___) => new T2_Investment()));
                    },
                    child: itemDrawer(Icons.style, "Übungen")),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder: (_, __, ___) => new T2_Amount()));
                    },
                    child: itemDrawer(
                        Icons.insert_drive_file, "Kalender")),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder: (_, __, ___) => new SettingsUI()));
                    },
                    child: itemDrawer(
                        Icons.insert_drive_file, "Einstellungen")),
                SizedBox(
                  height: 3.0,
                )
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
    color: Color(0xFF86CBF9).withOpacity(0.6),
  );
}

///
/// item widget for drawer
///
Widget itemDrawer(IconData icon, String txt) {
  return Padding(
    padding: const EdgeInsets.only(top: 30.0, left: 20.0),
    child: Row(
      children: <Widget>[
        Icon(
          icon,
          size: 25.0,
          color: Colors.lightBlue,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                txt,
                style: TextStyle(color: Colors.white70, fontSize: 15.5),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget _cardHeader(lrmDataModel item) {
  return Stack(
    children: <Widget>[
      Container(
        height: 220.0,
        width: double.infinity,
        decoration: BoxDecoration(
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
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Maximilian Stenk",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontFamily: "Sans",
                        fontSize: 20.0),
                  ),
                  Icon(Icons.coronavirus)
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Männlich",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w100,
                        fontFamily: "Sans",
                        fontSize: 20.0),
                  ),

                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Erkrankungsdatum",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w200,
                      fontFamily: "Sans",
                      fontSize: 16.0,
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "Datum",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontFamily: "Sans",

                        ),
                      ),
                      Text(
                        "20/07/21",
                        style: TextStyle(
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
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(200.0),
                  topRight: Radius.circular(20.0))),
        ),
      ),
    ],
  );
}

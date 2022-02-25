import 'package:covidapp/Mozido/calendar_view/calendar_tab_bar.dart';
import 'package:covidapp/Mozido/puls_analyse.dart';
import 'package:covidapp/Mozido/Uebungen_webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Uebungen extends StatefulWidget {
  const Uebungen({Key? key}) : super(key: key);

  @override
  _UebungenState createState() => _UebungenState();
}

class _UebungenState extends State<Uebungen> {
  final GlobalKey<ScaffoldState> _Pulskey = new GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _Atem = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF313237),

      ///
      /// Appbar
      ///
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
        backgroundColor: const Color(0xFF313237),
        centerTitle: true,
        title: const Text(
          "Übung wählen",
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Sans",
              fontSize: 17.0,
              fontWeight: FontWeight.w600),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _card(Icons.air, "Atem Übung",
                "Die minderbelüfteten Lungenabschnitte gilt es in der Atemtherapie wieder mit Sauerstoff zu versorgen , um Langzeitschäden zu verhindern. Die Mobilisation ist dabei die effektivste Methode."),
            _card(Icons.favorite, "Puls Analyse",
                "Patienten, die die COVID-19-Infektion scheinbar überstanden hatten, klagten darüber, dass sie körperlich nicht belastbar waren, schnell ermüdeten und Luftnot hatten – etwa beim Treppensteigen."),
            _card(Icons.emoji_emotions, "Emotionaler Zustand",
                "Wie fühlen Sie sich heute? Beatworten Sie ein paar Fragen! ")
          ],
        ),
      ),
    );
  }

  ///
  /// Widget for card
  ///
  Widget _card(IconData _icon, String _title, String _desc) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 15.0, left: 15.0, right: 15.0, bottom: 5.0),
      child: InkWell(
        onTap: () {
          if (_title == "Puls Analyse") {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Puls_Analyse(
                        key: _Pulskey,
                      )),
            );
          }
          if (_title == "Atem Übung") {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Webview()));
          } else if (_title == "Emotionaler Zustand") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CalendarTabBar()));
          }
        },
        child: Container(
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 170.0,
                width: 4.0,
                decoration: const BoxDecoration(
                    color: Color(0xFF15EDED),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 65.0),
                child: Icon(
                  _icon,
                  color: Colors.white54,
                  size: 30.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: SizedBox(
                  width: 250.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        _title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "Sans",
                            fontWeight: FontWeight.w800,
                            fontSize: 16.5),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, right: 15.0),
                        child: Text(
                          _desc,
                          style: const TextStyle(
                              color: Colors.white54,
                              fontFamily: "Popins",
                              fontSize: 13.5),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:covidapp/covidapp/uebungen/breathing/breathe_main.dart';
import 'package:covidapp/covidapp/calendar_view/calendar_tab_bar.dart';
import 'package:covidapp/covidapp/uebungen/puls_messung/puls_analyse_screen.dart';
import 'package:covidapp/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Uebungen extends StatefulWidget {
  const Uebungen({Key? key}) : super(key: key);

  @override
  UebungenState createState() => UebungenState();
}

class UebungenState extends State<Uebungen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  @override

  /// Widget build 3 Übungen Classes. On Card Click  */

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
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).push(
                PageRouteBuilder(pageBuilder: (_, __, ___) => const Home()));
          },
        ),
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
                "Die unterversorgten Lungenteile gilt es in der Atemtherapie zu aktivieren, um Langzeitschäden zu verhindern. Die Aktivierung der Atmung ist dabei die effektivste Methode."),
            _card(Icons.favorite, "Puls Analyse",
                "Die Überwachung der Pulsfrequenz ermöglicht ihnen, ihren Gesundheitszustand zu überwachen und Heilungsfortschritte zu erkennen."),
            _card(Icons.emoji_emotions, "Symptome",
                "Kalender und Symptomerfassung: Verschaffen Sie sich einen Überblick über die Entwicklung ihrer Symptome")
          ],
        ),
      ),
    );
  }

  ///
  /// Widget for card
  ///
  Widget _card(IconData icon, String title, String desc) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 15.0, left: 15.0, right: 15.0, bottom: 5.0),
      child: InkWell(
        onTap: () {
          if (title == "Atem Übung") {
            Navigator.of(context).pushReplacement(PageRouteBuilder(
                pageBuilder: (_, __, ___) => const UebungBreathing()));
          }
          if (title == "Puls Analyse") {
            Navigator.of(context).pushReplacement(
              PageRouteBuilder(
                  pageBuilder: (_, __, ___) => const PulsAnalyse()),
            );
          }
          if (title == "Symptome") {
            Navigator.of(context).pushReplacement(PageRouteBuilder(
                pageBuilder: (_, __, ___) => const CalendarTabBar()));
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
                  icon,
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
                        title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "Sans",
                            fontWeight: FontWeight.w800,
                            fontSize: 16.5),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, right: 15.0),
                        child: Text(
                          desc,
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

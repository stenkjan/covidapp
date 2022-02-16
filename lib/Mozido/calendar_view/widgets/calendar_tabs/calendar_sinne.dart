import 'package:covidapp/Mozido/content/calendar_content.dart';
import 'package:covidapp/Mozido/content/strings.dart';
import 'package:covidapp/Mozido/services/db_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalendarSinne extends StatefulWidget {
  const CalendarSinne({Key? key}) : super(key: key);
  @override
  CalendarSinneState createState() => CalendarSinneState();
  // TODO: implement createState

}

class CalendarSinneState extends State<CalendarSinne> with ChangeNotifier {
  var zustand = <String>[];
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    final calContent = Provider.of<CalendarContent>(context);

    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 0.0),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      '''images/lcs_geschmack.png''',
                    ),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            height: 12,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 360,
                height: 25,
                child: Text('${headline[3]['name']}',
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                    softWrap: false,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 20,
                        fontFamily: "Sans",
                        fontWeight: FontWeight.w400,
                        color: Colors.white70)),
              ),
              SizedBox(
                width: 360,
                height: 25,
                child: Text('${headline[3]['desc']}',
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                    softWrap: false,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 16,
                        fontFamily: "Sans",
                        fontWeight: FontWeight.w400,
                        color: Colors.white70)),
              ),
            ],
          ),
          const SizedBox(
            height: 0,
          ),
          Center(
            child: Row(
              children: [
                const Text("Anzahl",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Sans",
                        fontWeight: FontWeight.w400,
                        color: Colors.white70)),
                CupertinoSwitch(
                  value: _switchValue,
                  onChanged: (value) {
                    setState(() {
                      _switchValue = value;
                      calContent.calendarContentsinne(_switchValue);
                      dispose();
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Future<void> dispose() async {
    super.dispose();
  }
}
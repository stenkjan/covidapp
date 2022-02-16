import 'package:covidapp/Mozido/content/calendar_content.dart';
import 'package:covidapp/Mozido/content/strings.dart';
import 'package:covidapp/Mozido/services/db_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalendarSchlaf extends StatefulWidget {
  const CalendarSchlaf({Key? key}) : super(key: key);
  @override
  CalendarSchlafState createState() => CalendarSchlafState();
  // TODO: implement createState

}

class CalendarSchlafState extends State<CalendarSchlaf> with ChangeNotifier {
  var zustand = <String>[];
  double _value = 1;

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
                      '''images/lcs_schlaf.png''',
                    ),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 360,
                height: 25,
                child: Text(
                    "${headline[5]['name']} "
                    ": ",
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
                child: Text('${headline[5]['desc']}',
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
          Slider(
              min: 1,
              max: 10,
              value: _value,
              onChanged: (value) {
                _value = value;
                notifyListeners();
                calContent.calendarContentschlaf(value);
                dispose();
              })
        ],
      ),
    );
  }

  @override
  Future<void> dispose() async {
    super.dispose();
  }
}

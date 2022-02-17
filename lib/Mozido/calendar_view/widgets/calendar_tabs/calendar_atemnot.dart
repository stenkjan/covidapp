import 'package:covidapp/Mozido/content/calendar_content.dart';
import 'package:covidapp/Mozido/content/strings.dart';
import 'package:covidapp/Mozido/services/db_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalendarAtemnot extends StatefulWidget {
  const CalendarAtemnot({Key? key}) : super(key: key);
  @override
  CalendarAtemnotState createState() => CalendarAtemnotState();
  // TODO: implement createState

}

class CalendarAtemnotState extends State<CalendarAtemnot> {
  var zustand = <String>[];
  double _value = 1;

  @override
  Widget build(BuildContext context) {
    final calContent = Provider.of<CalendarContent>(context);
    final TextEditingController atemnotController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 0.0),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      '''images/lcs_atemwege.png''',
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
                height: 50,
                child: Text(
                    '${headline[2]['name']}' ": " '${headline[2]['desc']}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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
            height: 20,
          ),
          SizedBox(
            width: 360,
            height: 25,
            child: TextField(
              textAlign: TextAlign.center,
              controller: atemnotController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: "Anzahl",
                  fillColor: Colors.white70),
            ),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(150, 30),
                primary: const Color(0xFF029CF5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: const BorderSide(color: Color(0x815DDFDF)),
                ),
              ),
              child: const Text('Bestätigen'),
              onPressed: () async {
                // ignore: unnecessary_null_comparison
                if (atemnotController.text != null) {
                  calContent.calendarContentatemnot(atemnotController.text);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('''
                          Bitte geben Sie einen Wert an'''),
                  ));
                }
              }),
        ],
      ),
    );
  }
}

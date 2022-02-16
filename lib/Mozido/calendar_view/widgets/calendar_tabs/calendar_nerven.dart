import 'package:covidapp/Mozido/content/calendar_content.dart';
import 'package:covidapp/Mozido/content/strings.dart';
import 'package:covidapp/Mozido/services/db_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalendarNerven extends StatefulWidget {
  const CalendarNerven({Key? key}) : super(key: key);
  @override
  CalendarNervenState createState() => CalendarNervenState();
  // TODO: implement createState

}

class CalendarNervenState extends State<CalendarNerven> with ChangeNotifier {
  var zustand = <String>[];
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    final calContent = Provider.of<CalendarContent>(context);
    final TextEditingController nervenController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 0.0),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      '''images/lcs_nerven.png''',
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
                child: Text(
                    '${headline[6]['name']}' ": " "${headline[6]['desc']}",
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
          Row(
            children: [
              TextField(
                textAlign: TextAlign.center,
                controller: nervenController,
                decoration: InputDecoration(
                    icon:
                        const Icon(Icons.email_rounded, color: Colors.white24),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "Anzahl",
                    fillColor: Colors.white70),
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
                    if (nervenController.text != null) {
                      calContent.calendarContentnerven(nervenController.text);
                      dispose();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('''
                          Bitte geben Sie einen Wert an'''),
                      ));
                    }
                  }),
            ],
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

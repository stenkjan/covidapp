import 'package:covidapp/Mozido/calendar_view/widgets/calendar_image_views/muedigkeit_desc.dart';
import 'package:covidapp/Mozido/content/calendar_content.dart';
import 'package:covidapp/Mozido/content/size.dart';
import 'package:covidapp/Mozido/content/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalendarMuedigkeit extends StatefulWidget {
  const CalendarMuedigkeit({Key? key}) : super(key: key);
  @override
  CalendarMuedigkeitState createState() => CalendarMuedigkeitState();
  // TODO: implement createState

}

class CalendarMuedigkeitState extends State<CalendarMuedigkeit> {
  var zustand = <String>[];
  double _value = 1;
  bool _switchValue = false;
  List<String> list = ["Nein", "Ja"];
  int i = 0;

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
                      '''images/lcs_allgemein.png''',
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
                width: SizeConfig.getWidth(context),
                height: 25,
                child: Text('${headline[1]['name']}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
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
                child: Text(
                    '${moodList[0]['name']}'
                    " - "
                    '${moodList[3]['name']}'
                    ' (1 - 10)',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 16,
                        fontFamily: "Sans",
                        fontWeight: FontWeight.w400,
                        color: Colors.white70)),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CupertinoSwitch(
                      value: _switchValue,
                      onChanged: (value) {
                        setState(() {
                          _switchValue = value;
                          if (!value) i = 0;
                          if (value) i = 1;
                          /* calContent.calendarContentherz(_switchValue); */
                        });
                      },
                    ),
                    Text(list[i],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 16,
                            fontFamily: "Sans",
                            fontWeight: FontWeight.w400,
                            color: Colors.white70)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 0,
          ),
          const SizedBox(
            height: 0,
          ),
          Opacity(
            opacity: i.toDouble(),
            child: Slider(
                min: 1,
                max: 10,
                activeColor: const Color(0xFF31A1C9),
                inactiveColor: Colors.orange,
                label: "Müdigkeit",
                value: _value,
                onChanged: (value) {
                  _value = value;
                  calContent.calendarContentmuedigkeit(value);
                }),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                      pageBuilder: (_, __, ___) => MuedigkeitDesc()),
                );
              },
              child: Hero(
                tag: "muedigkeit",
                child: CircleAvatar(
                  maxRadius: 70,
                  backgroundImage: AssetImage("images/lcs_allgemein.png"),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Material(
                        color: Color(0xFF313237),
                        shadowColor: Color(0xFF2E4E57),
                        borderRadius: BorderRadius.circular(12),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                        )),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

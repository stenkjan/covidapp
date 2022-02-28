import 'package:covidapp/Mozido/calendar_view/widgets/calendar_image_views/herz_desc.dart';
import 'package:covidapp/Mozido/content/calendar_content.dart';
import 'package:covidapp/Mozido/content/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalendarHerz extends StatefulWidget {
  const CalendarHerz({Key? key}) : super(key: key);
  @override
  CalendarHerzState createState() => CalendarHerzState();
  // TODO: implement createState

}

class CalendarHerzState extends State<CalendarHerz> {
  var zustand = <String>[];
  double _value = 1;
  late Color colorswitch;
  bool _switchValue = false;
  List<String> list = ["Nein", "Ja"];
  int i = 0;
  @override
  void initState() {
    list;
    i = 0;
    colorswitch = const Color(0xFF313237);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
                      '''images/lcs_herz.png''',
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
                child: Text("${headline[4]['name']} ",
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
                child: Text("${headline[4]['desc']}",
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
                      if (_switchValue == true) {
                        colorswitch = Colors.white;
                      }
                      if (_switchValue == false) {
                        colorswitch = const Color(0xFF313237);
                      }
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
          const SizedBox(
            height: 0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    10,
                    (index) => Text((index + 1).toString(),
                        style: TextStyle(
                          color: colorswitch,
                        )),
                  ),
                ),
              ),
              Opacity(
                opacity: i.toDouble(),
                child: Slider(
                    min: 1,
                    max: 10,
                    divisions: 10,
                    activeColor: const Color(0xFF31A1C9),
                    inactiveColor: Colors.orange,
                    label: "Herz",
                    value: _value,
                    onChanged: (value) {
                      _value = value;
                      calContent.calendarContentherz(_value);
                    }),
              ),
            ],
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(pageBuilder: (_, __, ___) => HerzDesc()),
                );
              },
              child: Hero(
                tag: "herz",
                child: CircleAvatar(
                  maxRadius: 70,
                  backgroundImage: const AssetImage("images/lcs_herz.png"),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Material(
                        color: const Color(0xFF313237),
                        shadowColor: const Color(0xFF2E4E57),
                        borderRadius: BorderRadius.circular(12),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
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

import 'package:covidapp/Mozido/calendar_view/widgets/calendar_image_views/mood_desc.dart';
import 'package:covidapp/Mozido/content/calendar_content.dart';
import 'package:covidapp/Mozido/content/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalendarMood extends StatefulWidget {
  const CalendarMood({Key? key}) : super(key: key);
  @override
  CalendarMoodState createState() => CalendarMoodState();
  // TODO: implement createState

}

class CalendarMoodState extends State<CalendarMood> {
  var zustand = <String>[];
  var firstPress;

  @override
  void initState() {
    firstPress = false;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final calContent = Provider.of<CalendarContent>(context);
    double _value = 1;
    bool _switchValue = false;
    List<String> list = ["Nein", "Ja"];
    int i = 0;
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  gradient: LinearGradient(
                    colors: [Color(0xFF31A1C9), Color(0xFF3DB6D4)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                        text:
                            moodList[0]['icon1'] ?? 'null', // emoji characters
                        style: const TextStyle(
                          fontFamily: 'EmojiOne',
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print(calContent.count.toString() +
                                ' count ' );
                            if (firstPress == false) {
                              calContent.increment();
                              calContent.calendarContentmood(
                                  moodList[0]['amount'] * 100);
                            
                              setState(() {
                                firstPress = true;
                              });
                            } else if (firstPress) {
                              setState(() {});
                            }
                            //method giving data to calendar;
                          }),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  gradient: LinearGradient(
                    colors: [Color(0xFF31A1C9), Color(0xFF3DB6D4)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                        text:
                            moodList[1]['icon2'] ?? 'null', // emoji characters
                        style: const TextStyle(
                          fontFamily: 'EmojiOne',
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            if (firstPress == false) {
                              calContent.increment();
                              calContent.calendarContentmood(70);

                              setState(() {
                                firstPress = true;
                              });
                            }
                            //method giving data to calendar;
                          }),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  gradient: LinearGradient(
                    colors: [Color(0xFF31A1C9), Color(0xFF3DB6D4)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                        text:
                            moodList[2]['icon3'] ?? 'null', // emoji characters
                        style: const TextStyle(
                          fontFamily: 'EmojiOne',
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            if (firstPress == false) {
                              calContent.increment();
                              calContent.calendarContentmood(50);

                              setState(() {
                                firstPress = true;
                              });
                            }
                            //method giving data to calendar;
                          }),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  gradient: LinearGradient(
                    colors: [Color(0xFF31A1C9), Color(0xFF3DB6D4)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: RichText(
                    text: TextSpan(
                        text:
                            moodList[3]['icon4'] ?? 'null', // emoji characters
                        style: const TextStyle(
                          fontFamily: 'EmojiOne',
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            if (firstPress == false) {
                              calContent.increment();
                              calContent.calendarContentmood(0);

                              setState(() {
                                firstPress = true;
                              });
                            }
                            //method giving data to calendar;
                          }),
                  ),
                ),
              ),
            ],
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
                    '${headline[0]['name']}'
                    ": "
                    '${moodList[0]['name']}'
                    " - "
                    '${moodList[3]['name']}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 18,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoSwitch(
                  value: _switchValue,
                  onChanged: (value) {
                    setState(() {
                      _switchValue = value;
                      if (!value) i = 0;
                      if (value) i = 1;
                      // calContent.calendarContentmood(_switchValue);
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
          Opacity(
            opacity: i.toDouble(),
            child: Slider(
                min: 1,
                max: 10,
                activeColor: const Color(0xFF31A1C9),
                inactiveColor: Colors.orange,
                label: "Gefühlszustand",
                value: _value,
                onChanged: (value) {
                  _value = value;
                  calContent.calendarContentmood(_value.round());
                }),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(pageBuilder: (_, __, ___) => MoodDesc()),
                );
              },
              child: Hero(
                tag: "mood",
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
          /* Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Provider.of<T2_Calendar>(context,
                  //         listen: false)
                  //     .showAddDialog;
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(color: Color(0xFF31A1C9)),
                  ),
                ),
                child: const Text(
                  'Kommentar',
                ),
              ),
              const SizedBox(width: 15),
              IconButton(
                  color: const Color(0xB0E4DD09),
                  iconSize: 40,
                  icon: const Icon(Icons.help),
                  onPressed: () {}),
            ],
          ), */
        ],
      ),
    );
  }
}

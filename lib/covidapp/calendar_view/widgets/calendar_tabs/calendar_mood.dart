import 'package:covidapp/covidapp/calendar_view/widgets/calendar_image_views/mood_desc.dart';
import 'package:covidapp/covidapp/content/calendar_content.dart';
import 'package:covidapp/covidapp/content/strings.dart';
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
                            print(calContent.count.toString() + ' count ');
                            if (firstPress == false) {
                              calContent.increment();
                              calContent
                                  .calendarContentmood(moodList[0]['amount']);

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
                              calContent.calendarContentmood(
                                  moodList[1]['amount'] + 1);

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
                              calContent.calendarContentmood(
                                  moodList[2]['amount'] * 2);

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
                              calContent.calendarContentmood(
                                  moodList[3]['amount'] + 6);

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
              const SizedBox(height: 5),
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
            width: 360,
            height: 50,
            child: Text(
                "In der Grafik bedeuet 10 Ausgezeichnet und 100 schlecht",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Italic",
                    fontWeight: FontWeight.w400,
                    color: Colors.white24)),
          ),
          const SizedBox(
            height: 0,
          ),
          const SizedBox(
            height: 50,
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
                  backgroundImage: const AssetImage("images/lcs_allgemein.png"),
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
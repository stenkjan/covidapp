import 'package:covidapp/Mozido/content/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class T2KalenderMood extends StatefulWidget {
  const T2KalenderMood({Key? key}) : super(key: key);
  @override
  T2KalenderMoodState createState() => T2KalenderMoodState();
  // TODO: implement createState

}

class T2KalenderMoodState extends State<T2KalenderMood> {
  var zustand = <String>[];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 0.0),
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
                        text: mood[0]['icon1'] ?? 'null', // emoji characters
                        style: const TextStyle(
                          fontFamily: 'EmojiOne',
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            zustand.add(calenderChoices[0]['item1']);
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
                        text: calenderChoices[0]['icon2'] ??
                            'null', // emoji characters
                        style: const TextStyle(
                          fontFamily: 'EmojiOne',
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            zustand.add(calenderChoices[0]['item2']);

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
                        text: calenderChoices[0]['icon3'] ??
                            'null', // emoji characters
                        style: const TextStyle(
                          fontFamily: 'EmojiOne',
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            zustand.add(calenderChoices[0]['item3']);

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
                        text: calenderChoices[0]['icon4'] ??
                            'null', // emoji characters
                        style: const TextStyle(
                          fontFamily: 'EmojiOne',
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            zustand.add(calenderChoices[0]['item4']);

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
              Container(
                width: 360,
                height: 25,
                child: SizedBox(
                  child: Text(
                      calenderChoices[0]['name'] +
                          ": " +
                          calenderChoices[0]['item1'] +
                          " - " +
                          calenderChoices[0]['item4'],
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
              ),
            ],
          ),
          const SizedBox(
            height: 0,
          ),
          Row(
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
          ),
        ],
      ),
    );
  }
}

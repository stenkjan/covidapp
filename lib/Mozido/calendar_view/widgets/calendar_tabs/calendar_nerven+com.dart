import 'package:covidapp/Mozido/calendar_view/widgets/calendar_image_views/misc_desc.dart';
import 'package:covidapp/Mozido/calendar_view/widgets/calendar_image_views/nerven_desc.dart';
import 'package:covidapp/Mozido/content/calendar_content.dart';
import 'package:covidapp/Mozido/content/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalendarNervCom extends StatefulWidget {
  const CalendarNervCom({Key? key}) : super(key: key);
  @override
  CalendarNervComState createState() => CalendarNervComState();
  // TODO: implement createState

}

class CalendarNervComState extends State<CalendarNervCom> {
  var zustand = <String>[];
  double _value = 1;
  bool _switchValue = false;
  List<String> list = ["Nein", "Ja"];
  int i = 0;

  @override
  Widget build(BuildContext context) {
    final calContent = Provider.of<CalendarContent>(context);
    final TextEditingController nervenController = TextEditingController();
    final TextEditingController anderesymptomeController =
        TextEditingController();

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
                child: Text('${headline[6]['name']}',
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
              SizedBox(
                width: 360,
                height: 40,
                child: Text("${headline[6]['desc']}",
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
            height: 10,
          ),
          Column(
            children: [
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
                    SizedBox(width: 30),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) => NervComDesc()),
                        );
                      },
                      child: Hero(
                        tag: "nerven",
                        child: CircleAvatar(
                          maxRadius: 25,
                          backgroundImage: AssetImage("images/lcs_nerven.png"),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Material(
                                color: Color(0xFF313237),
                                borderRadius: BorderRadius.circular(12),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                )),
                          ),
                        ),
                      ),
                    ),
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
                    label: "Müdigkeit",
                    value: _value,
                    onChanged: (value) {
                      _value = value;
                      calContent.calendarContentnerven(_value);
                    }),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: 300,
                        height: 25,
                        child: Text("${headline[7]['tag']}",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                fontSize: 16,
                                fontFamily: "Sans",
                                fontWeight: FontWeight.w400,
                                color: Colors.white70)),
                      ),
                      SizedBox(
                        width: 300,
                        height: 40,
                        child: Text("${headline[7]['name']}",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            softWrap: false,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                fontSize: 14,
                                fontFamily: "Sans",
                                fontWeight: FontWeight.w400,
                                color: Colors.white70)),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) => MiscDesc()),
                        );
                      },
                      child: Hero(
                        tag: "misc",
                        child: CircleAvatar(
                          maxRadius: 25,
                          backgroundImage: AssetImage("images/lcs_sonstige.png"),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Material(
                                color: Color(0xFF313237),
                                borderRadius: BorderRadius.circular(12),
                                shadowColor: Color(0xFF2E4E57),
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
              Row(
                children: [
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: anderesymptomeController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey[800]),
                          hintText: "${headline[7]['desc']}",
                          fillColor: Colors.white70),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(50, 50),
                        primary: const Color(0xFF029CF5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: const BorderSide(color: Color(0x815DDFDF)),
                        ),
                      ),
                      child: const Icon(Icons.comment),
                      onPressed: () async {
                        // ignore: unnecessary_null_comparison
                        if (anderesymptomeController.text != null) {
                          calContent.calendarContentcomment(
                              anderesymptomeController.text);
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('''
                      Bitte geben Sie einen Kommentar an'''),
                          ));
                        }
                      }),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

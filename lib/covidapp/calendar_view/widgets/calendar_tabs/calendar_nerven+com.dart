// ignore_for_file: file_names

import 'package:covidapp/covidapp/calendar_view/widgets/calendar_image_views/nerven_desc.dart';
import 'package:covidapp/covidapp/content/calendar_content.dart';
import 'package:covidapp/covidapp/content/strings.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';

class CalendarNervCom extends StatefulWidget {
  const CalendarNervCom({Key? key}) : super(key: key);
  @override
  CalendarNervComState createState() => CalendarNervComState();
}

class CalendarNervComState extends State<CalendarNervCom> {
  var zustand = <String>[];
  static  double _value = 1;
  late Color colorswitch;

  static bool _switchValue = false;
  List<String> list = ["Nein", "Ja"];
  static int i = 0;
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
                    SizedBox(
                      height: 25,
                      width: 50,
                      child: NeumorphicSwitch(
                        style: const NeumorphicSwitchStyle(
                            inactiveTrackColor: Color(0xFF2E4E57),
                            lightSource: LightSource.bottom),
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
                    ),
                    const SizedBox(width: 5),
                    Text(list[i],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 16,
                            fontFamily: "Sans",
                            fontWeight: FontWeight.w400,
                            color: Colors.white70)),
                    const SizedBox(width: 30),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) => const NervComDesc()),
                        );
                      },
                      child: Hero(
                        tag: "nerven",
                        child: CircleAvatar(
                          maxRadius: 25,
                          backgroundImage:
                              const AssetImage("images/lcs_nerven_hero.png"),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Material(
                                color: const Color(0xFF313237),
                                borderRadius: BorderRadius.circular(12),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
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
                        divisions: 10,
                        min: 1,
                        max: 10,
                        value: _value,
                        onChanged: (value) {
                          _value = value;
                        
                          calContent.calendarContentnerven(_value);
                        }),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
        
            ],
          ),
        ],
      ),
    );
  }
}

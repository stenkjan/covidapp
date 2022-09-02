import 'package:covidapp/covidapp/calendar_view/widgets/calendar_image_views/schlaf_desc.dart';
import 'package:covidapp/covidapp/content/calendar_content.dart';
import 'package:covidapp/covidapp/content/strings.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';

class CalendarSchlaf extends StatefulWidget {
  const CalendarSchlaf({Key? key}) : super(key: key);
  @override
  CalendarSchlafState createState() => CalendarSchlafState();
}

class CalendarSchlafState extends State<CalendarSchlaf> {
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
                      '''images/lcs_schlaf.png''',
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
              const SizedBox(
                width: 360,
                height: 25,
                child: Text('Skala 1-10',
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                    softWrap: false,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Sans",
                        fontWeight: FontWeight.w500,
                        color: Colors.white70)),
              ),
              const SizedBox(
                height: 30,
              ),
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
                  ],
                ),
              ),
            ],
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
                      calContent.calendarContentschlaf(_value);
                 
                    }),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const SchlafDesc()),
                    );
                  },
                  child: Hero(
                    tag: "schlaf",
                    child: CircleAvatar(
                      maxRadius: 70,
                      foregroundColor: const Color(0xFF313237),
                      backgroundImage:
                          const AssetImage("images/lcs_schlaf_hero.png"),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Material(
                            color: const Color(0xFF313237),
                            borderRadius: BorderRadius.circular(12),
                            shadowColor: const Color(0xFF2E4E57),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                            )),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text("Für Beschreibung Bild anklicken",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: "Italic",
                      fontWeight: FontWeight.w400,
                      color: Colors.white70)),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:covidapp/covidapp/content/strings.dart';
import 'package:flutter/material.dart';

class NervComDesc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF363940),
        body: Hero(
          tag: "nerven",
          child: Expanded(
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                    child: Container(
                      width: 195,
                      height: 269,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: Color(0xFF363940),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10.0,
                              spreadRadius: 2.0,
                            ),
                          ],
                          image: DecorationImage(
                              image: AssetImage(
                                "images/lcs_nerven.png",
                              ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 360,
                    height: 50,
                    child: Text('${headline[6]['desc']}',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 20,
                            fontFamily: "Sans",
                            fontWeight: FontWeight.w400,
                            color: Colors.white70)),
                  ),
                  const Divider(
                    color: Colors.blueGrey,
                    thickness: 2.0,
                    indent: 20.0,
                    endIndent: 20.0,
                  ),
                  const SizedBox(
                    width: 360,
                    height: 130,
                    child: Text(
                        'Long Covid geht auf die Nerven: Konzentrationsmangel und Gedächtnisprobleme. Hier sollte ganz genau hin geschaut werden, wie die Symptome sich nach einer bestätigten SARS-CoV 2 Infektion entwickeln.',
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Sans",
                            fontWeight: FontWeight.w400,
                            color: Colors.white70)),
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xB444B2C5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: const BorderSide(color: Color(0x815DDFDF)),
                        ),
                      ),
                      child: const Text('Okay'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

import 'package:covidapp/covidapp/content/strings.dart';
import 'package:flutter/material.dart';

class HerzDesc extends StatelessWidget {
  const HerzDesc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF363940),
        body: Hero(
          tag: "herz",
          child: ListView(
            children: 
              [Center(
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
                                  "images/lcs_herz.png",
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
                      child: Text(
                          '${headline[4]['name']}'
                          ": "
                          '${headline[4]['desc']}',
                          maxLines: 2,
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
                          'Herz-/Kreislaufstörungen können vielerlei Ursachen haben. Long Covid stellt ein ausgeprägtes Risiko für den Herz-Kreislauf dar, deshalb sollten Sie auf Symptome wie stechen in der Brust, einen hohen Puls und Durchbutungsstörungen achten.',
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
            ],
          ),
        ));
  }
}

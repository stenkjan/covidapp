import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidapp/covidapp/calendar_view/widgets/colors.dart';
import 'package:covidapp/covidapp/content/calendar_content.dart';
import 'package:covidapp/covidapp/services/grafik_service.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';

class GrafikDataStream extends StatelessWidget {
  final String documentId;
  final String uid;

  // ignore: use_key_in_widget_constructors
  const GrafikDataStream(this.documentId, this.uid);

  @override
  Widget build(BuildContext context) {
    final grafService = Provider.of<GrafikService>(context);
    final calContent = Provider.of<CalendarContent>(context);
    grafService.uid = uid;
    final CollectionReference calCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('calendar');
    return FutureBuilder<DocumentSnapshot>(
        future: calCollection.doc(documentId).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Container(
                height: 40,
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 4.0,
                ),
                child: Neumorphic(
                    style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(12)),
                        depth: 15,
                        intensity: 3.0,
                        shadowLightColor: Colors.transparent,
                       
                        color: const Color(0xFF31A1C9)),
                    child: const Text("Irgendwas ist schief gelaufen")));
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return Container(
                height: 40,
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 4.0,
                ),
                child: Neumorphic(
                    style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(12)),
                        depth: 15,
                        intensity: 3.0,
                        shadowLightColor: Colors.transparent,
                       
                        color: const Color(0xFF31A1C9)),
                    child: const Text("Dokument existiert nicht")));
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            calContent.dayliepieMap(data, int.parse(documentId));
          

            return SizedBox(
              width: 350,
              height: 230,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  ListTile(
                    dense: true,
                    visualDensity: const VisualDensity(
                      horizontal: 0,
                      vertical: -4,
                    ),
                    title: Container(
                        width: 300,
                        height: 25,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0)),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF31A1C9),
                              Color.fromARGB(255, 6, 84, 104),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 5),
                              child: Icon(
                                Icons.circle,
                                color: AppColors.pieColors[7],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 5, left: 5),
                              child: const Text("Gemütszustand",
                                  style: TextStyle(color: Colors.white)),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 5),
                              child: Text("${data['mood']}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          calContent.getLevel(data['mood']))),
                            ),
                          ],
                        )),
                  ),
                  ListTile(
                    dense: true,
                    visualDensity: const VisualDensity(
                      horizontal: 0,
                      vertical: -4,
                    ),
                    title: Container(
                        width: 300,
                        height: 25,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0)),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF31A1C9),
                              Color.fromARGB(255, 6, 84, 104),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 5),
                              child: Icon(
                                Icons.circle,
                                color: AppColors.pieColors[0],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 5, left: 5),
                              child: const Text("Müdigkeit",
                                  style: TextStyle(color: Colors.white)),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 5),
                              child: Text("${data['muedigkeit']}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: calContent
                                          .getLevel(data['muedigkeit']))),
                            ),
                          ],
                        )),
                  ),
                  ListTile(
                    dense: true,
                    visualDensity: const VisualDensity(
                      horizontal: 0,
                      vertical: -4,
                    ),
                    title: Container(
                        width: 300,
                        height: 25,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0)),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF31A1C9),
                              Color.fromARGB(255, 6, 84, 104),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 5),
                              child: Icon(
                                Icons.circle,
                                color: AppColors.pieColors[1],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 5, left: 5),
                              child: const Text("Atemnot",
                                  style: TextStyle(color: Colors.white)),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 5),
                              child: Text("${data['atemnot']}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: calContent
                                          .getLevel(data['atemnot']))),
                            ),
                          ],
                        )),
                  ),
                  ListTile(
                    dense: true,
                    visualDensity: const VisualDensity(
                      horizontal: 0,
                      vertical: -4,
                    ),
                    title: Container(
                        width: 300,
                        height: 25,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0)),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF31A1C9),
                              Color.fromARGB(255, 6, 84, 104),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 5),
                              child: Icon(
                                Icons.circle,
                                color: AppColors.pieColors[2],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 5, left: 5),
                              child: const Text("Sinnesverlust",
                                  style: TextStyle(color: Colors.white)),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 5),
                              child: Text("${data['sinne']}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          calContent.getLevel(data['sinne']))),
                            ),
                          ],
                        )),
                  ),
                  ListTile(
                    dense: true,
                    visualDensity: const VisualDensity(
                      horizontal: 0,
                      vertical: -4,
                    ),
                    title: Container(
                        width: 300,
                        height: 25,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0)),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF31A1C9),
                              Color.fromARGB(255, 6, 84, 104),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 5),
                              child: Icon(
                                Icons.circle,
                                color: AppColors.pieColors[3],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 5, left: 5),
                              child: const Text("Herz-/Kreislauf",
                                  style: TextStyle(color: Colors.white)),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 5),
                              child: Text("${data['herz']}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          calContent.getLevel(data['herz']))),
                            ),
                          ],
                        )),
                  ),
                  ListTile(
                    dense: true,
                    visualDensity: const VisualDensity(
                      horizontal: 0,
                      vertical: -4,
                    ),
                    title: Container(
                        width: 300,
                        height: 25,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0)),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF31A1C9),
                              Color.fromARGB(255, 6, 84, 104),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 5),
                              child: Icon(
                                Icons.circle,
                                color: AppColors.pieColors[4],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 5, left: 5),
                              child: const Text("Schlafstörungen",
                                  style: TextStyle(color: Colors.white)),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 5),
                              child: Text("${data['schlaf']}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          calContent.getLevel(data['schlaf']))),
                            ),
                          ],
                        )),
                  ),
                  ListTile(
                    dense: true,
                    visualDensity: const VisualDensity(
                      horizontal: 0,
                      vertical: -4,
                    ),
                    title: Container(
                        width: 300,
                        height: 25,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0)),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF31A1C9),
                              Color.fromARGB(255, 6, 84, 104),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 5),
                              child: Icon(
                                Icons.circle,
                                color: AppColors.pieColors[5],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 5, left: 5),
                              child: const Text("Nerven (Kopfschmerzen)",
                                  style: TextStyle(color: Colors.white)),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 5),
                              child: Text("${data['nerven']}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color:
                                          calContent.getLevel(data['nerven']))),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            );
          }

          return Container(
              height: 40,
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 4.0,
              ),
              child: Neumorphic(
                  margin: const EdgeInsets.all(1.0),
                  style: NeumorphicStyle(
                      shape: NeumorphicShape.concave,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(12)),
                      depth: 15,
                      intensity: 3.0,
                      shadowLightColor: Colors.transparent,
                 
                      color: const Color(0xFF31A1C9)),
                  child: Container(
                      height: 35,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 4.0,
                      ),
                      child: const Text("laden..."))));
        });
  }
}

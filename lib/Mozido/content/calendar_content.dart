import 'package:flutter/cupertino.dart';
import 'package:covidapp/Mozido/content/strings.dart';

class CalendarContent with ChangeNotifier {
  late String mood;
  late String muedigkeit;
  late String atemnot;
  late String sinne;
  late String herz;
  late String schlaf;
  late String nerven;
/*   CalendarContent(this.mood, this.muedigkeit, this.atemnot, this.sinne,
      this.herz, this.schlaf); */

  String calendarContentmood(int i) {
    mood = moodList[i]['amount'];
    return mood;
    notifyListeners();
  }

  String calendarContentmuedigkeit(int i, int a) {
    return muedigkeit;
    notifyListeners();
  }

  /*  String calenderContentmuedigkeit(int i){
    muedigkeit = headline[i]['name']
  };
  String calenderContentatemnot;
  String calenderContentsinne;
  String calenderContentherz;
  String calenderContentschlaf; */
}

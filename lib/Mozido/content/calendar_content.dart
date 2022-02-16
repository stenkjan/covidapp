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

  String calendarContentmuedigkeit(double d) {
    muedigkeit = d.toString();
    return muedigkeit;
    notifyListeners();
  }

  String calendarContentatemnot(String a) {
    atemnot = a;
    return atemnot;
    notifyListeners();
  }

  String calendarContentsinne(bool b) {
    sinne = b.toString();
    return sinne;
    notifyListeners();
  }

  String calendarContentherz(bool c) {
    herz = c.toString();
    return herz;
    notifyListeners();
  }

  String calendarContentschlaf(double s) {
    schlaf = s.toString();
    return schlaf;
    notifyListeners();
  }

  String calendarContentnerven(String n) {
    nerven = n.toString();
    return nerven;
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

import 'package:covidapp/Mozido/services/calendar_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:covidapp/Mozido/content/strings.dart';
import 'package:provider/provider.dart';

class CalendarContent with ChangeNotifier {
  late String mood;
  late String muedigkeit;
  late String atemnot;
  late String sinne;
  late String herz;
  late String schlaf;
  late String nerven;
  late String comment;
  int count = 0;

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

  String calendarContentcomment(String com) {
    comment = com.toString();
    return comment;
    notifyListeners();
  }

  bool increment(int count) {
    count++;
    this.count = count;
    if (count == 3) {
      return true;
    } else {
      return false;
    }
  }

  void clear() {
    mood = "";
    muedigkeit = "";
    atemnot = "";
    sinne = "";
    herz = "";
    schlaf = "";
    nerven = "";
    comment = "";
  }

  /*  String calenderContentmuedigkeit(int i){
    muedigkeit = headline[i]['name']
  };
  String calenderContentatemnot;
  String calenderContentsinne;
  String calenderContentherz;
  String calenderContentschlaf; */

}

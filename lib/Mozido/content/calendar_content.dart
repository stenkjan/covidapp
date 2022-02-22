import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidapp/Mozido/services/calendar_service.dart';
import 'package:covidapp/Mozido/services/grafik_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:covidapp/Mozido/content/strings.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class CalendarContent with ChangeNotifier {
  late int mood;
  int muedigkeit = 0;
  int atemnot = 0;
  int sinne = 0;
  int herz = 0;
  int schlaf = 0;
  int nerven = 0;
  String comment = "";
  late String createdDate;
  late int createDateInt;
  int count = 0;
  bool docExists = false;
  int currentDate = int.parse(DateFormat('d').format(DateTime.now()));
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  GrafikService gS = GrafikService();

/*   CalendarContent(this.mood, this.muedigkeit, this.atemnot, this.sinne,
      this.herz, this.schlaf); */

  int calendarContentmood(int i) {
    mood = i;
    createdDate = currentDate.toString();
    notifyListeners();
    return mood;
  }

  int calendarContentmuedigkeit(double d) {
    muedigkeit = d.round();
    notifyListeners();
    return muedigkeit;
  }

  int calendarContentatemnot(double a) {
    atemnot = a.round();
    notifyListeners();
    return atemnot;
  }

  int calendarContentsinne(double b) {
    sinne = b.round();
    notifyListeners();
    return sinne;
  }

  int calendarContentherz(double c) {
    herz = c.round();
    notifyListeners();
    return herz;
  }

  int calendarContentschlaf(double s) {
    schlaf = s.round();
    notifyListeners();
    return schlaf;
  }

  int calendarContentnerven(double n) {
    nerven = n.round();
    notifyListeners();
    return nerven;
  }

  String calendarContentcomment(String com) {
    comment = com;
    notifyListeners();
    return comment;
  }

  bool increment() {
    if (count == 0) {
      count++;
      notifyListeners();
      print(count);
    }

    if (count == 1) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> clear() async {
    createDateInt = int.parse(createdDate);
    DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(gS.uid)
        .collection('calendar')
        .doc(createdDate)
        .get();
    if (docSnapshot.exists) {
      docExists = true;
      notifyListeners();
      mood = 0;
      muedigkeit = 0;
      atemnot = 0;
      sinne = 0;
      herz = 0;
      schlaf = 0;
      nerven = 0;
      comment = "";
      createdDate = "";
      print(docExists.toString() + ' : doc should exist');
      return docExists;
    } else {
      docExists = false;
      print(docExists.toString() + ' : doc  not exist');
      notifyListeners();
      return docExists;
    }
  }
  //database abfrage für createdDate = ""
}
  

  /*  String calenderContentmuedigkeit(int i){
    muedigkeit = headline[i]['name']
  };
  String calenderContentatemnot;
  String calenderContentsinne;
  String calenderContentherz;
  String calenderContentschlaf; */

//}

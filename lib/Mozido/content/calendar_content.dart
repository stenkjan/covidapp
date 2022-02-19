import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidapp/Mozido/services/calendar_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:covidapp/Mozido/content/strings.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class CalendarContent with ChangeNotifier {
  late String mood;
  late String muedigkeit;
  late String atemnot;
  late String sinne;
  late String herz;
  late String schlaf;
  late String nerven;
  late String comment;
  late String createdDate;
  late int createDateInt;
  int count = 0;
  int currentDate = int.parse(DateFormat('d').format(DateTime.now()));
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  auth.User? user;

/*   CalendarContent(this.mood, this.muedigkeit, this.atemnot, this.sinne,
      this.herz, this.schlaf); */

  String calendarContentmood(int i) {
    mood = moodList[i]['amount'];
    notifyListeners();
    return mood;
  }

  String calendarContentmuedigkeit(double d) {
    muedigkeit = d.toString();
    notifyListeners();
    return muedigkeit;
  }

  String calendarContentatemnot(String a) {
    atemnot = a;
    notifyListeners();
    return atemnot;
  }

  String calendarContentsinne(bool b) {
    sinne = b.toString();
    notifyListeners();
    return sinne;
  }

  String calendarContentherz(bool c) {
    herz = c.toString();
    notifyListeners();
    return herz;
  }

  String calendarContentschlaf(double s) {
    schlaf = s.toString();
    notifyListeners();
    return schlaf;
  }

  String calendarContentnerven(String n) {
    nerven = n.toString();
    notifyListeners();
    return nerven;
  }

  String calendarContentcomment(String com) {
    comment = com.toString();
    notifyListeners();
    return comment;
  }

  bool increment(int count) {
    count++;
    notifyListeners();
    this.count = count;
    if (count == 3) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> clear() async {
    bool docExists = false;
    createDateInt = int.parse(createdDate);
    DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .collection('calendar')
        .doc(createdDate)
        .get();
    if (docSnapshot.exists) {
      mood = "";
      muedigkeit = "";
      atemnot = "";
      sinne = "";
      herz = "";
      schlaf = "";
      nerven = "";
      comment = "";
      createdDate = "";
      return docExists = true;
    } else {
      return docExists = false;
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

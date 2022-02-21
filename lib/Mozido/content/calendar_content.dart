import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidapp/Mozido/services/calendar_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:covidapp/Mozido/content/strings.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

class CalendarContent with ChangeNotifier {
  late int mood;
  late int muedigkeit;
  late int atemnot;
  late int sinne;
  late int herz;
  late int schlaf;
  late int nerven;
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

  int calendarContentmood(int i) {
    mood = moodList[i]['amount'];

    return mood;
  }

  int calendarContentmuedigkeit(double d) {
    muedigkeit = d.round();

    return muedigkeit;
  }

  int calendarContentatemnot(double a) {
    atemnot = a.round();

    return atemnot;
  }

  int calendarContentsinne(double b) {
    sinne = b.round();

    return sinne;
  }

  int calendarContentherz(double c) {
    herz = c.round();

    return herz;
  }

  int calendarContentschlaf(double s) {
    schlaf = s.round();

    return schlaf;
  }

  int calendarContentnerven(double n) {
    nerven = n.round();

    return nerven;
  }

  String calendarContentcomment(String com) {
    comment = com;

    return comment;
  }

  bool increment(int count) {
    count++;

    this.count = count;
    if (count == 2) {
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
      mood = 0;
      muedigkeit = 0;
      atemnot = 0;
      sinne = 0;
      herz = 0;
      schlaf = 0;
      nerven = 0;
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

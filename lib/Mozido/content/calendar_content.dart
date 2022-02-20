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

    return mood;
  }

  String calendarContentmuedigkeit(double d) {
    muedigkeit = d.toString();

    return muedigkeit;
  }

  String calendarContentatemnot(String a) {
    atemnot = a;

    return atemnot;
  }

  String calendarContentsinne(String b) {
    sinne = b.toString();

    return sinne;
  }

  String calendarContentherz(String c) {
    herz = c.toString();

    return herz;
  }

  String calendarContentschlaf(double s) {
    schlaf = s.toString();

    return schlaf;
  }

  String calendarContentnerven(String n) {
    nerven = n.toString();

    return nerven;
  }

  String calendarContentcomment(String com) {
    comment = com.toString();

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

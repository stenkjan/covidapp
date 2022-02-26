import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidapp/Mozido/calendar_view/widgets/colors.dart';
import 'package:covidapp/Mozido/services/calendar_service.dart';
import 'package:covidapp/Mozido/services/grafik_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:covidapp/Mozido/content/strings.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

import '../Puls_Messung/heart_bpm.dart';

class CalendarContent with ChangeNotifier {
  bool saved = false;
  late int mood = moodL.last;
  late int muedigkeit = muedigkeitL.last;
  late int atemnot = atemnotL.last;
  late int sinne = sinneL.last;
  late int herz = herzL.last;
  late int schlaf = schlafL.last;
  late int nerven = nervenL.last;
  String comment = "";
  late String createdDate;
  late int createDateInt;
  int count = 0;
  int varCount = 0;
  int daycount = 0;
  bool docExists = false;
  bool pieLegendbool = true;
  late List calList;
  late List headlineupdate;
  int currentDate = int.parse(DateFormat('d').format(DateTime.now()));
  String fullDate = DateFormat(
    'd/M/y',
  ).format(DateTime.now());
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  GrafikService gS = GrafikService();
  String? userId;
/*   CalendarContent(this.mood, this.muedigkeit, this.atemnot, this.sinne,
      this.herz, this.schlaf); */

  List<int> dateL = [20, 21, 22, 23, 24, 25];
  List<int> moodL = [5, 4, 3, 5, 7, 8];
  List<int> muedigkeitL = [3, 0, 0, 1, 0, 3];
  List<int> atemnotL = [0, 0, 1, 5, 3, 0];
  List<int> sinneL = [0, 1, 3, 2, 4, 1];
  List<int> herzL = [3, 4, 6, 8, 6, 5];
  List<int> schlafL = [3, 2, 4, 2, 3, 2];
  List<int> nervenL = [5, 6, 8, 5, 6, 4];
  List<int> bpm = [70, 80, 85, 70, 90, 100];
  List bpmday = [];
/*   List<int> bpmValues = [100, 120, 70, 80]; */

  int calendarContentmood(int i) {
    mood = i;
    userId = gS.uid;
    moodL.add(mood);
    createdDate = currentDate.toString();
    notifyListeners();
    return mood;
  }

  List<int> bpmWeekL() {
    num sum = 0;
    for (num e in bpmday) {
      sum += e;
    }
    bpm.add(sum.round());
    return bpm;
  }

  List getCalendarList(bool daychange) {
    if (daychange) {
      varCount++;
      daycount = currentDate + varCount;
      if (daycount > currentDate) {
        daycount--;
      }
    }

    if (!daychange) {
      varCount--;
      daycount = currentDate - varCount;
      if (daycount < 1) {
        daycount++;
      }
    }
    headlineupdate = headline;

    print(daycount.toString() + " to varcount");
    int index = dateL.indexWhere((daycount) => this.daycount.isEven);
    print(index);
    createdDate = currentDate.toString();
    mood = moodL[index];
    muedigkeit = muedigkeitL[index];
    atemnot = atemnotL[index];
    sinne = sinneL[index];
    herz = herzL[index];
    schlaf = schlafL[index];
    nerven = nervenL[index];

    calList = [
      dateL[index],
      moodL[index],
      muedigkeitL[index],
      atemnotL[index],
      sinneL[index],
      herzL[index],
      schlafL[index],
      nervenL[index]
    ];
    headline[0]['value'] = calList[1];
    headline[1]['value'] = calList[2];
    headline[2]['value'] = calList[3];
    headline[3]['value'] = calList[4];
    headline[4]['value'] = calList[5];
    headline[5]['value'] = calList[6];
    headline[5]['value'] = calList[7];

    notifyListeners();
    print(index.toString() + " getCalenderListIndex");
    return calList;
  }

  Color getCalendarColors(int value) {
    Color color = Colors.grey;
    /*  List? calColorList;
    for (var i = 0; i < calList!.length - 2; i++) {
      final int category = headline[i];
      if (category <= 2) {
        calColorList!.add(AppColors.pieColors[2]);
        headline.where((i) => headline[i].add(category));
      } */

    if (value >= 1 && value <= 2) {
      return color = (AppColors.pieColors[2]);
    }
    if (value >= 3 && value <= 4) {
      return color = (AppColors.pieColors[3]);
    }
    if (value >= 5 && value <= 7) {
      return color = (AppColors.pieColors[4]);
    }
    if (value >= 7 && value <= 10) {
      return color = (AppColors.pieColors[5]);
    }
    if (value == 0) {
      print(color.toString() + " null");
      return color;
    }
    return color;
  }

  Color getCalendarColorSum() {
    double value = listSum();
    Color color = Color(0xFF31A1C9);

    if (value >= 1 && value <= 2) {
      return color = (AppColors.pieColors[2]);
    }
    if (value >= 3 && value <= 4) {
      return color = (AppColors.pieColors[3]);
    }
    if (value >= 5 && value <= 7) {
      return color = (AppColors.pieColors[4]);
    }
    if (value >= 7 && value <= 10) {
      return color = (AppColors.pieColors[5]);
    }
    if (value == 0) {
      print(color.toString() + " null");
      return color;
    }
    return color;
  }

  double listSum() {
    double sum = mood.toDouble() +
        muedigkeit.toDouble() +
        atemnot.toDouble() +
        sinne.toDouble() +
        herz.toDouble() +
        schlaf.toDouble() +
        nerven.toDouble();
    if (sum != 0) return sum;
    if (sum == 0) {
      print("no value in List!");
    }
    return sum;
  }

  double answeredSum() {
    double sum = 0;
    if (mood != 0) sum++;
    if (muedigkeit != 0) sum++;
    if (atemnot != 0) sum++;
    if (sinne != 0) sum++;
    if (herz != 0) sum++;
    if (schlaf != 0) sum++;
    if (nerven != 0) sum++;
    return sum;
  }

  int calendarContentmuedigkeit(double d) {
    muedigkeit = d.round();
    muedigkeitL.add(muedigkeit);
    notifyListeners();
    return muedigkeit;
  }

  int calendarContentatemnot(double a) {
    atemnot = a.round();
    atemnotL.add(atemnot);
    notifyListeners();
    return atemnot;
  }

  int calendarContentsinne(double b) {
    sinne = b.round();
    sinneL.add(sinne);
    notifyListeners();
    return sinne;
  }

  int calendarContentherz(double c) {
    herz = c.round();
    herzL.add(herz);
    notifyListeners();
    return herz;
  }

  int calendarContentschlaf(double s) {
    schlaf = s.round();
    schlafL.add(schlaf);
    notifyListeners();
    return schlaf;
  }

  int calendarContentnerven(double n) {
    nerven = n.round();
    nervenL.add(nerven);
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
    saved = true;
    createDateInt = int.parse(createdDate);
    dateL.add(createDateInt);
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

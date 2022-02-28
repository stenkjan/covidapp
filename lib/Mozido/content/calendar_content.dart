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
  /** Variables Initizialisation  */
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
  bool daychangeBool = false;
  bool docExists = false;
  bool pieLegendbool = true;

  late List calList;
  late List headlineupdate;

  bool breatheTrue = false;

  bool pulseTrue = false;
  bool calTrue = false;

  String breatheMin = "0";

  int currentDate = int.parse(DateFormat('d').format(DateTime.now()));
  int grafikcurrentDateCal = 0;
  String fullDate = DateFormat(
    'd/M/y',
  ).format(DateTime.now());

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  GrafikService gS = GrafikService();
  String? userId;

  int listIndex = 0;
  int index = 0;
  List<int> dateL = [20, 21, 22, 23, 24, 25, 26, 27];
  List<int> moodL = [5, 4, 3, 5, 7, 8, 8, 2];
  List<int> muedigkeitL = [3, 0, 0, 1, 0, 3, 4, 3];
  List<int> atemnotL = [0, 0, 1, 5, 3, 0, 1, 0];
  List<int> sinneL = [0, 1, 3, 2, 4, 1, 2, 1];
  List<int> herzL = [3, 4, 6, 8, 6, 5, 0, 5];
  List<int> schlafL = [3, 2, 4, 2, 3, 2, 0, 2];
  List<int> nervenL = [5, 6, 8, 5, 6, 4, 5, 4];
  List<int> bpm = [70, 80, 85, 70, 90, 100, 70, 75];
  List bpmday = [];

  int calendarContentmood(int i) {
    mood = i;
    userId = gS.uid;
    moodL.add(mood);
    createdDate = currentDate.toString();
    notifyListeners();
    return mood;
  }

  bool returnBreatheTrue() {
    bool breatheTrue = true;
    this.breatheTrue = breatheTrue;

    return breatheTrue;
  }

  bool returnPulseTrue() {
    bool pulseTrue = true;
    this.pulseTrue = pulseTrue;

    return pulseTrue;
  }

  bool returnCalTrue() {
    bool calTrue = true;
    this.calTrue = calTrue;
    return calTrue;
  }

  String getlastBPM() {
    if (returnPulseTrue() == true) {
      return bpm.last.toString();
    } else {
      return "";
    }
  }

  Icon getpulseTrue() {
    Icon iconDone =
        const Icon(Icons.check_circle, size: 17.0, color: Colors.lightGreen);
    Icon iconNotDone = const Icon(Icons.radio_button_unchecked,
        size: 17.0, color: Colors.redAccent);
    if (returnPulseTrue() == true) {
      return iconDone;
    } else {
      calTrue = false;
      return iconNotDone;
    }
  }

  Icon getcalendarTrue() {
    Icon iconDone =
        const Icon(Icons.check_circle, size: 17.0, color: Colors.lightGreen);
    Icon iconNotDone = const Icon(Icons.radio_button_unchecked,
        size: 17.0, color: Colors.redAccent);
    if (returnCalTrue() == true) {
      return iconDone;
    } else {
      calTrue = false;
      return iconNotDone;
    }
  }

  Icon getbreatheTrue() {
    Icon iconDone =
        const Icon(Icons.check_circle, size: 17.0, color: Colors.lightGreen);
    Icon iconNotDone = const Icon(Icons.radio_button_unchecked,
        size: 17.0, color: Colors.redAccent);
    if (returnBreatheTrue() == true || breatheMin.isNotEmpty) {
      return iconDone;
    } else {
      return iconNotDone;
    }
  }

/** timestring gets the Brathing -- if empty -sets the String to 0 */
  String getBreatheMin(String timeString) {
    if (returnBreatheTrue() == true) {
      breatheMin = timeString;
    }
    if (breatheMin.isEmpty) {
      breatheMin = "0";
    }

    return breatheMin;
  }

  String returnBreatheMin() {
    return breatheMin;
  }

  List<int> bpmWeekL() {
    num sum = 0;
    for (num e in bpmday) {
      sum += e;
    }
    bpm.add(sum.round());
    notifyListeners();
    return bpm;
  }

  bool dayChanged() {
    return daychangeBool;
  }

  /** boolean for current Date */
  bool getgrafikCurrentDate(int grafikcurrentDate) {
    grafikcurrentDateCal = grafikcurrentDate;
    bool curDateooRange = false;
    if (grafikcurrentDateCal > dateL.last) {
      curDateooRange = true;
      return curDateooRange;
    } else if (grafikcurrentDateCal < dateL.first) {
      curDateooRange = true;
      return curDateooRange;
    }
    return curDateooRange;
  }

  int getIndex() {
    return index;
  }

  Map<String, double> daypiedataMap() {
    int indexgetter = getIndex();
    if (indexgetter > dateL.length - 1) {
      indexgetter--;
    }
    if (indexgetter < 0) {
      indexgetter++;
    }
/**Pie Map Initialization */
    Map<String, double> daypiedataMap = {
      headline[1]['tag']: calContent.muedigkeitL[indexgetter].toDouble(),
      headline[2]['tag']: calContent.atemnotL[indexgetter].toDouble(),
      headline[3]['tag']: calContent.sinneL[indexgetter].toDouble(),
      headline[4]['tag']: calContent.herzL[indexgetter].toDouble(),
      headline[5]['tag']: calContent.schlafL[indexgetter].toDouble(),
      headline[6]['tag']: calContent.nervenL[indexgetter].toDouble(),
    };
    return daypiedataMap;
  }

  List getCalendarList() {
    /* print(daychange.toString() + " daychange");
    if (daychange == true) {
      daychangeBool = true;
      varCount = grafikcurrentDateCal;

      print(varCount.toString() + " :vC++");
      daycount = grafikcurrentDateCal + varCount;
      if (daycount > grafikcurrentDateCal) {
        daycount = dateL.last;
      }
    }

    if (daychange == false) {
      daychangeBool = false;
      varCount = grafik;
      print(varCount.toString() + " :vC--");
      daycount = grafikcurrentDateCal - varCount;
      if (daycount < 1) {
        daycount++;
      }
    } */

    headlineupdate = headline;
    daycount = grafikcurrentDateCal;
    print(daycount.toString() + " :dC");

    index = dateL.indexOf(daycount);
    print(index.toString() + " index daycount");
    if (index < 0 || index > dateL.length) {
      index = dateL.indexOf(daycount - 1);
      if (index < 0) index = dateL.indexOf(dateL.first);
    }
    print(index.toString() + " : index of dateL");
    createdDate = currentDate.toString();
    if (index <= moodL.length) {
      mood = moodL[index];
    } else {
      mood = 0;
    }
    if (index <= muedigkeitL.length) {
      muedigkeit = muedigkeitL[index];
    } else {
      muedigkeit = 0;
    }
    if (index <= atemnotL.length) {
      atemnot = atemnotL[index];
    } else {
      atemnot = 0;
    }
    if (index <= sinneL.length) {
      sinne = sinneL[index];
    } else {
      sinne = 0;
    }
    if (index <= herzL.length) {
      herz = herzL[index];
    } else {
      herz = 0;
    }
    if (index <= schlafL.length) {
      schlaf = schlafL[index];
    } else {
      schlaf = 0;
    }
    if (index <= nervenL.length) {
      nerven = nervenL[index];
    } else {
      nerven = 0;
    }

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
/** Initializing Calender Color */

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

/** Saving the Variables to double  */
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

  String getcalAnswer() {
    if (calTrue == true) {
      return answeredSumInt().toString();
    } else {
      return "";
    }
  }

/** Counter */
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

  int answeredSumInt() {
    if (saved == true) {
      int sum = answeredSum().toInt();
      return sum;
    } else {
      return 0;
    }
  }

/** Listener Database update */
  int calendarContentmuedigkeit(double d) {
    muedigkeit = d.round();
    muedigkeitL.add(muedigkeit);
    notifyListeners();
    return muedigkeit;
  }

/** Calender Atemnot */
  int calendarContentatemnot(double a) {
    atemnot = a.round();
    atemnotL.add(atemnot);
    notifyListeners();
    return atemnot;
  }

/** Calender Sinne */
  int calendarContentsinne(double b) {
    sinne = b.round();
    sinneL.add(sinne);
    notifyListeners();
    return sinne;
  }

/** Calender Herz */
  int calendarContentherz(double c) {
    herz = c.round();
    herzL.add(herz);
    notifyListeners();
    return herz;
  }

/** Calender schlaf */
  int calendarContentschlaf(double s) {
    schlaf = s.round();
    schlafL.add(schlaf);
    notifyListeners();
    return schlaf;
  }

/** Calender Nerven */
  int calendarContentnerven(double n) {
    nerven = n.round();
    nervenL.add(nerven);
    notifyListeners();
    return nerven;
  }

/** Calender Comment */
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

/** Push to Firebase  */
  Future<bool> clear() async {
    createDateInt = int.parse(createdDate);
    if (createDateInt > dateL.last.toInt()) {
      dateL.add(createDateInt);
      listIndex++;
      if (listIndex >= 30) {
        listIndex = 0;
      }
    }
    saved = true;
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

      notifyListeners();
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

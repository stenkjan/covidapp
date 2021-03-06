// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidapp/covidapp/calendar_view/widgets/colors.dart';
import 'package:covidapp/covidapp/services/grafik_service.dart';

import 'package:covidapp/covidapp/content/strings.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/*MasterClass of Variable Declaration and Methods for Value Exchange */

class CalendarContent with ChangeNotifier {
  /// Variables Inititialisation
  bool saved = false;
/*calendar variables*/
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
/*calendar variable initialisation*/
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

  bool spoofCheck = false;
  List<bool> calBoolL = List.generate(31, (index) => false);
  List<bool> breatheBoolL = List.generate(31, (index) => false);
  List<bool> pulseBoolL = List.generate(31, (index) => false);
  String breatheMin = "0";
  double sum = 0;
  double sumColor = 0;

  Color color = Colors.grey;

  int currentDate = int.parse(DateFormat('d').format(DateTime.now()));
  int grafikcurrentDateCal = 0;
  String fullDate = DateFormat(
    'd/M/y',
  ).format(DateTime.now());

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  GrafikService gS = GrafikService();
  String? userId;
/*calendar variables lists with initial data*/
  int listIndex = 0;
  int indexGrafik = 0;
  int index = 0;
  //List<int> dateL = [20, 21, 22, 23, 24, 25, 26, 27];
  List<int> dateL = List.generate(31, (index) => index);
  List<int> moodL = List.generate(31, (index) => index);
  List<int> muedigkeitL = List.generate(31, (index) => index);
  List<int> atemnotL = List.generate(31, (index) => index);
  List<int> sinneL = List.generate(31, (index) => index);
  List<int> herzL = List.generate(31, (index) => index);
  List<int> schlafL = List.generate(31, (index) => index);
  List<int> nervenL = List.generate(31, (index) => index);
  List<int> bpm = List.generate(31, (index) => index);
  List bpmday = [100, 70, 75];
  List introList = [];
  List sumColorList = List.generate(31, (index) => index);

  String fireDate = "";

//URLs for Webview: Title and Link
  Map<String, String> urlMap = {
    "infektionsschutz.de":
        "https://www.infektionsschutz.de/coronavirus/basisinformationen/long-covid-langzeitfolgen-von-covid-19/",
    "sozialministerium.at":
        "https://www.sozialministerium.at/Corona-Schutzimpfung/Long-COVID.html",
    "rki.de":
        "https://www.rki.de/SharedDocs/FAQ/NCOV2019/FAQ_Liste_Gesundheitliche_Langzeitfolgen.html",
    "longcovidaustria.at": "https://www.longcovidaustria.at/",
    "Long Covid Leitlinie":
        "https://oegam.at/system/files/attachments/kurz_long_covid_s1_master_211104.pdf",
    "Klinische Falldefinition der WHO":
        "https://apps.who.int/iris/bitstream/handle/10665/350195/WHO-2019-nCoV-Post-COVID-19-condition-Clinical-case-definition-2021.1-ger.pdf?sequence=1&isAllowed=y",
  };
  //URL-Description and Image for WebViewMain
  Map<AssetImage, String> urlMapDesc = {
    const AssetImage("images/Icon_Images/infektionsschutz_web.png"):
        "Informationssetie des Bundesministerium f??r Gesundheit in Deutschland in Zusammenarbeit mit dem RKI.",
    const AssetImage("images/Icon_Images/sozialministerium_web.png"):
        "https://www.sozialministerium.at/Corona-Schutzimpfung/Long-COVID.html",
    const AssetImage("images/Icon_Images/rki_web.png"):
        "Aktuelle Informationen zu Long Covid vom Robert Koch Institut.",
    const AssetImage("images/Icon_Images/longcovidaustria_web.png"):
        "Infoportal und Kontaktinformationen f??r Long Covid - Verein & Betroffeneninitiative.",
    const AssetImage("images/Icon_Images/oegam_web.png"):
        "Medizinische Leitlinie in Auftrag der ??sterreichischen Gesellschaft f??r Allgemein- und Familienmedizin.",
    const AssetImage("images/Icon_Images/who_web.png"):
        "Die klinische Falldefinition der WHO: Grundlage f??r die medizinische Beurteilung von Long Covid.",
  };

  ///Map for PieChart
  Map<String, double> pieMap = {};
  Map<String, double> graphMap = {};
/*calendar variable functions to send and retrieve calendar data*/
  int calendarContentmood(int i) {
    mood = i;
    userId = gS.uid;
    moodL.add(mood);
    createdDate = currentDate.toString();
    notifyListeners();
    return mood;
  }

  bool returnBreatheTrue() {
    breatheTrue = true;
    print("no way");
    return breatheTrue;
  }

  bool returnPulseTrue() {
    pulseTrue = true;

    return pulseTrue;
  }

  bool returnCalTrue() {
    calTrue = true;

    return calTrue;
  }

  String getlastBPM() {
    if (pulseTrue == true) {
      //return bpm.last.toString();
      return bpmday.last.toString();
    } else {
      return "";
    }
  }

  Icon getpulseTrue() {
    Icon iconDone =
        const Icon(Icons.check_circle, size: 17.0, color: Colors.lightGreen);
    Icon iconNotDone = const Icon(Icons.radio_button_unchecked,
        size: 17.0, color: Colors.redAccent);
    if (pulseTrue == true) {
      return iconDone;
    } else {
      pulseTrue = false;
      return iconNotDone;
    }
  }

  Icon getcalendarTrue() {
    Icon iconDone =
        const Icon(Icons.check_circle, size: 17.0, color: Colors.lightGreen);
    Icon iconNotDone = const Icon(Icons.radio_button_unchecked,
        size: 17.0, color: Colors.redAccent);
    if (calTrue == true) {
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
    if (breatheTrue == true && breatheMin.isNotEmpty) {
      return iconDone;
    } else {
      breatheTrue = false;
      return iconNotDone;
    }
  }

  Icon getallTrue() {
    Icon iconDone = const Icon(Icons.task_alt,
        semanticLabel: "Check", color: Colors.lightGreen);
    Icon iconNotDone =
        const Icon(Icons.task_alt, semanticLabel: "Check", color: Colors.white);
    if (breatheTrue == true &&
        breatheMin.isNotEmpty &&
        pulseTrue == true &&
        calTrue == true) {
      return iconDone;
    } else {
      return iconNotDone;
    }
  }

  Icon getpulseTrueWeek(int day) {
    Icon iconDone =
        const Icon(Icons.check_circle, size: 17.0, color: Colors.lightGreen);
    Icon iconNotVisible = const Icon(Icons.radio_button_unchecked,
        size: 17.0, color: Colors.transparent);
    if (pulseBoolL[day] == true) {
      return iconDone;
    } else {
      return iconNotVisible;
    }
  }

  Icon getcalendarTrueWeek(int day) {
    Icon iconDone =
        const Icon(Icons.check_circle, size: 17.0, color: Colors.lightGreen);

    Icon iconNotVisible = const Icon(Icons.radio_button_unchecked,
        size: 17.0, color: Colors.transparent);
    if (calBoolL[day] == true) {
      calTrue = true;
      return iconDone;
    }
    if (spoofCheck == false) {
      return iconDone;
    } else {
      return iconNotVisible;
    }
  }

  Icon getbreatheTrueWeek(int day) {
    Icon iconDone =
        const Icon(Icons.check_circle, size: 17.0, color: Colors.lightGreen);
    Icon iconNotVisible = const Icon(Icons.radio_button_unchecked,
        size: 17.0, color: Colors.transparent);
    if (breatheBoolL[day] == true) {
      return iconDone;
    } else {
      return iconNotVisible;
    }
  }

  /// timestring gets the Brathing -- if empty -sets the String to 0 */
  String getBreatheMin(String timeString) {
    if (breatheTrue == true) {
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

  /// boolean for current Date */
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

  Map<String, double> daypiedataMapCalendar(int day) {
    int indexgetter = dateL.indexOf(day);
    if (indexgetter > dateL.length - 1) {
      indexgetter--;
    }
    if (indexgetter < 0) {
      indexgetter++;
    }
/**Pie Map Initialization */
    Map<String, double> daypiedataMapCal = {
      headline[1]['tag']: calContent.muedigkeitL[indexgetter].toDouble(),
      headline[2]['tag']: calContent.atemnotL[indexgetter].toDouble(),
      headline[3]['tag']: calContent.sinneL[indexgetter].toDouble(),
      headline[4]['tag']: calContent.herzL[indexgetter].toDouble(),
      headline[5]['tag']: calContent.schlafL[indexgetter].toDouble(),
      headline[6]['tag']: calContent.nervenL[indexgetter].toDouble(),
    };
    var values = daypiedataMapCal.values;
    sumColor = (values.reduce((sum, element) => sum + element)) / 7;
    pulseBoolL[indexgetter] = false;
    breatheBoolL[indexgetter] = false;
    calBoolL[indexgetter] = false;
    sumColorList[indexgetter] = sumColor;
    return daypiedataMapCal;
  }

  void dayliepieMap(Map<String, dynamic> map, int day) {
    pieMap = {
      headline[1]['tag']: map['muedigkeit'].toDouble(),
      headline[2]['tag']: map['atemnot'].toDouble(),
      headline[3]['tag']: map['sinne'].toDouble(),
      headline[4]['tag']: map['herz'].toDouble(),
      headline[5]['tag']: map['schlaf'].toDouble(),
      headline[6]['tag']: map['nerven'].toDouble(),
    };
    calContent.muedigkeitL[day] = map['muedigkeit'];
    calContent.atemnotL[day] = map['atemnot'];
    calContent.sinneL[day] = map['sinne'];
    calContent.herzL[day] = map['herz'];
    calContent.schlafL[day] = map['schlaf'];
    calContent.nervenL[day] = map['nerven'];
    var values = pieMap.values;
    sumColor = (values.reduce((sum, element) => sum + element)) / 7;
    pulseBoolL[map['created_date']] = true;
    breatheBoolL[map['created_date']] = true;
    calBoolL[map['created_date']] = true;
    sumColorList[map['created_date']] = sumColor;
  }

  Map<String, double> getpieMap() {
    if (pieMap.isEmpty) {
      pieMap = daypiedataMap();
    }

    return pieMap;
  }

  void weekpiedataMap(List map) {
    /* map.forEach((key, value) {
      if (kDebugMode) {
        print('Key: $key');
        print('Value: $value');
        print('------------------------------');
      }
    }); */
    moodL[calContent.listIndex] = (map[map.length - 7]['mood']);
    moodL[calContent.listIndex + 1] = (map[map.length - 6]['mood']);
    moodL[calContent.listIndex + 2] = (map[map.length - 5]['mood']);
    moodL[calContent.listIndex + 3] = (map[map.length - 4]['mood']);
    moodL[calContent.listIndex + 4] = (map[map.length - 3]['mood']);
    moodL[calContent.listIndex + 5] = (map[map.length - 2]['mood']);
    moodL[calContent.listIndex + 6] = (map[map.length - 1]['mood']);

    muedigkeitL[calContent.listIndex] = (map[map.length - 7]['mood']);
    muedigkeitL[calContent.listIndex + 1] = (map[map.length - 6]['mood']);
    muedigkeitL[calContent.listIndex + 2] = (map[map.length - 5]['mood']);
    muedigkeitL[calContent.listIndex + 3] = (map[map.length - 4]['mood']);
    muedigkeitL[calContent.listIndex + 4] = (map[map.length - 3]['mood']);
    muedigkeitL[calContent.listIndex + 5] = (map[map.length - 2]['mood']);
    muedigkeitL[calContent.listIndex + 6] = (map[map.length - 1]['mood']);

    atemnotL[calContent.listIndex] = (map[map.length - 7]['mood']);
    atemnotL[calContent.listIndex + 1] = (map[map.length - 6]['mood']);
    atemnotL[calContent.listIndex + 2] = (map[map.length - 5]['mood']);
    atemnotL[calContent.listIndex + 3] = (map[map.length - 4]['mood']);
    atemnotL[calContent.listIndex + 4] = (map[map.length - 3]['mood']);
    atemnotL[calContent.listIndex + 5] = (map[map.length - 2]['mood']);
    atemnotL[calContent.listIndex + 6] = (map[map.length - 1]['mood']);

    sinneL[calContent.listIndex] = (map[map.length - 7]['sinne']);
    sinneL[calContent.listIndex + 1] = (map[map.length - 6]['sinne']);
    sinneL[calContent.listIndex + 2] = (map[map.length - 5]['sinne']);
    sinneL[calContent.listIndex + 3] = (map[map.length - 4]['sinne']);
    sinneL[calContent.listIndex + 4] = (map[map.length - 3]['sinne']);
    sinneL[calContent.listIndex + 5] = (map[map.length - 2]['sinne']);
    sinneL[calContent.listIndex + 6] = (map[map.length - 1]['sinne']);

    herzL[calContent.listIndex] = (map[map.length - 7]['mood']);
    herzL[calContent.listIndex + 1] = (map[map.length - 6]['mood']);
    herzL[calContent.listIndex + 2] = (map[map.length - 5]['mood']);
    herzL[calContent.listIndex + 3] = (map[map.length - 4]['mood']);
    herzL[calContent.listIndex + 4] = (map[map.length - 3]['mood']);
    herzL[calContent.listIndex + 5] = (map[map.length - 2]['mood']);
    herzL[calContent.listIndex + 6] = (map[map.length - 1]['mood']);

    schlafL[calContent.listIndex] = (map[map.length - 7]['mood']);
    schlafL[calContent.listIndex + 1] = (map[map.length - 6]['mood']);
    schlafL[calContent.listIndex + 2] = (map[map.length - 5]['mood']);
    schlafL[calContent.listIndex + 3] = (map[map.length - 4]['mood']);
    schlafL[calContent.listIndex + 4] = (map[map.length - 3]['mood']);
    schlafL[calContent.listIndex + 5] = (map[map.length - 2]['mood']);
    schlafL[calContent.listIndex + 6] = (map[map.length - 1]['mood']);

    nervenL[calContent.listIndex] = (map[map.length - 7]['mood']);
    nervenL[calContent.listIndex + 1] = (map[map.length - 6]['mood']);
    nervenL[calContent.listIndex + 2] = (map[map.length - 5]['mood']);
    nervenL[calContent.listIndex + 3] = (map[map.length - 4]['mood']);
    nervenL[calContent.listIndex + 4] = (map[map.length - 3]['mood']);
    nervenL[calContent.listIndex + 5] = (map[map.length - 2]['mood']);
    nervenL[calContent.listIndex + 6] = (map[map.length - 1]['mood']);
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

//TODO: maybe not in use
  List getCalendarList() {
    headlineupdate = headline;
    daycount = grafikcurrentDateCal;
    print("$daycount :dC");

    index = dateL.indexOf(daycount);
    print("$index index daycount");

    if (index < 0) {
      index = dateL.indexOf(dateL.last);
    } else if (index > dateL.length) {
      index = dateL.indexOf(dateL.first);
    }
    print("$index : index of dateL");
    createdDate = currentDate.toString();
    if (index <= moodL.length) {
      mood = moodL[index];
      headline[0]["level"] = getLevel(mood);
    } else {
      mood = 0;
    }
    if (index <= muedigkeitL.length) {
      muedigkeit = muedigkeitL[index];
      headline[1]["level"] = getLevel(muedigkeit);
    } else {
      muedigkeit = 0;
    }
    if (index <= atemnotL.length) {
      atemnot = atemnotL[index];
      headline[2]["level"] = getLevel(atemnot);
    } else {
      atemnot = 0;
    }
    if (index <= sinneL.length) {
      sinne = sinneL[index];
      headline[3]["level"] = getLevel(sinne);
    } else {
      sinne = 0;
    }
    if (index <= herzL.length) {
      herz = herzL[index];
      headline[4]["level"] = getLevel(herz);
    } else {
      herz = 0;
    }
    if (index <= schlafL.length) {
      schlaf = schlafL[index];
      headline[5]["level"] = getLevel(schlaf);
    } else {
      schlaf = 0;
    }
    if (index <= nervenL.length) {
      nerven = nervenL[index];
      headline[6]["level"] = getLevel(nerven);
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
    print("$index getCalenderListIndex");
    return calList;
  }

  Color getLevel(int value) {
    Color color = Colors.grey;
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
      print("$color null");
      return color;
    }
    return color;
  }

  Color getCalendarColors(int value) {
    Color color = AppColors.pieColors[value];
    if (value == 0) {
      color = Colors.grey;
      return color;
    }
    return color;
  }

  /// Initializing Calendar Color */

  Color getCalendarColorSum(double sumColor) {
    double value = sumColor;

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
    /* if (value == 0) {
      print("$color null");
      return color;
    } */
    return color;
  }

  /// Saving the Variables to double  */
  /*  double listSum(Map<String, dynamic> data) {
    int sumInt = data['mood'] +
        data['muedigkeit'] +
        data['atemnot'] +
        data['sinne'] +
        data['herz'] +
        data['schlaf'] +
        data['nerven'];

    if (sumInt != 0) {
      sumColor = sumInt.toDouble() / 7;
      return sumColor;
    }
    if (sumInt == 0) {
      return sumColor;
      /* 
    double sum = mood.toDouble() +
        muedigkeit.toDouble() +
        atemnot.toDouble() +
        sinne.toDouble() +
        herz.toDouble() +
        schlaf.toDouble() +
        nerven.toDouble();
    sum = sum / 7; */

      /*  sum = moodL.last.toDouble() +
          muedigkeitL.last.toDouble() +
          atemnotL.last.toDouble() +
          sinneL.last.toDouble() +
          herzL.last.toDouble() +
          schlafL.last.toDouble() +
          nervenL.last.toDouble();
      sum = sum / 7; */
    }

    return sum;
  }
 */
  String getcalAnswer() {
    if (calTrue == true) {
      return answeredSumInt().toString();
    } else {
      return "";
    }
  }

  /// Counter */
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

  /// Listener Database update */
  int calendarContentmuedigkeit(double d) {
    muedigkeit = d.round();
    muedigkeitL.add(muedigkeit);
    notifyListeners();
    return muedigkeit;
  }

  /// Calender Atemnot */
  int calendarContentatemnot(double a) {
    atemnot = a.round();
    atemnotL.add(atemnot);
    notifyListeners();
    return atemnot;
  }

  /// Calender Sinne */
  int calendarContentsinne(double b) {
    sinne = b.round();
    sinneL.add(sinne);
    notifyListeners();
    return sinne;
  }

  /// Calender Herz */
  int calendarContentherz(double c) {
    herz = c.round();
    herzL.add(herz);
    notifyListeners();
    return herz;
  }

  /// Calender schlaf */
  int calendarContentschlaf(double s) {
    schlaf = s.round();
    schlafL.add(schlaf);
    notifyListeners();
    return schlaf;
  }

  /// Calender Nerven */
  int calendarContentnerven(double n) {
    nerven = n.round();
    nervenL.add(nerven);
    notifyListeners();
    return nerven;
  }

  /// Calender Comment */
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

  /// Push to Firebase  */
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
      print('$docExists : doc should exist');

      notifyListeners();
      return docExists;
    } else {
      docExists = false;
      print('$docExists : doc  not exist');

      notifyListeners();
      return docExists;
    }
  }
}

import 'dart:core';

import 'package:covidapp/covidapp/content/calendar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});
  //collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  late CollectionReference calendarCollection;
  late DocumentReference calendarDoc;
  late List docList;
  late Map nameData;
  int registeredDate = 0;
  int currentDate =
      int.parse(DateFormat('d').format(DateTime.now()).toString());
  static String name = "Long Covid App User";
  bool introChecK = false;
  final CalendarContent calContent = CalendarContent();
  Future updateUserData(String email, String firstname, String lastname,
      String birthday, bool introCheck) async {
    return await userCollection.doc(uid).set({
      'email': email,
      'firstname': firstname,
      'lastname': lastname,
      'birthday': birthday,
      'introCheck': introCheck,
    });
  }

  /// Model Updating  */

  Future updateCalendarModel(int mood, int muedigkeit, int atemnot, int sinne,
      int herz, int schlaf, int nerven, String comment, int createdDate) async {
    return await userCollection
        .doc(uid)
        .collection('calendar')
        .doc(createdDate.toString())
        .set({
      'id': uid,
      'mood': mood,
      'muedigkeit': muedigkeit,
      'atemnot': atemnot,
      'sinne': sinne,
      'herz': herz,
      'schlaf': schlaf,
      'nerven': nerven,
      'comment': comment,
      'created_date': createdDate,
    });
  }

  Future updateBreatheMinExerciseModel(var breathemin) async {
    return await userCollection
        .doc(uid)
        .collection('exercise')
        .doc('breathemin')
        .update({
      currentDate.toString(): breathemin,
    });
  }

  Future updateBreatheSecExerciseModel(var breathesec) async {
    return await userCollection
        .doc(uid)
        .collection('exercise')
        .doc('breathesec')
        .update({
      currentDate.toString(): breathesec,
    });
  }

  Future updatePulseExerciseModel(var pulse) async {
    return await userCollection
        .doc(uid)
        .collection('exercise')
        .doc('pulse')
        .update({
      currentDate.toString(): pulse,
    });
  }

  /// Reads the Collection on the given User */
  Future readcalendarCollection() async {
    calendarCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .collection('calendar');

    return await calendarCollection.get().then((QuerySnapshot querySnapshot) {
      registeredDate = querySnapshot.docs.length;
      if (querySnapshot.docs.isEmpty) {
        registeredDate = 1;
      }
    });
  }

  /// Get Data of User Class
  ///not in use yet!!!!!!!!!!!!!
  Future getUserData() async {
    return await userCollection
        .doc(uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        nameData = documentSnapshot.data() as Map;
        if (documentSnapshot.exists == false) {
          nameData = {
            'email': 'longcovid@longcovid.at',
            'firstname': 'Long',
            'lastname': 'Covid',
            'birthday': '01/01/2020',
          };
        }
        name = nameData["firstname"] + " " + nameData["lastname"];
        return name;
      }
      return name;
    });
  }

  String returnName() {
    return name;
  }

  /// read the doc of the requested date for the issued User UID
  Future readcalendarDocDaily(int createdDate, bool dayChange) async {
    int createdDateInt = createdDate;

    if (dayChange == false) {
      createdDateInt - 1;
      return await calendarDoc
          .collection('users')
          .doc(uid)
          .collection('calendar')
          .doc('createdDateInt')
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          docList = calendarDoc
              .collection('users')
              .doc(uid)
              .collection('calendar')
              .where('created_date', isEqualTo: createdDateInt)
              .snapshots()
              .toList() as List;
          if (documentSnapshot.exists == false) {
            docList = calendarDoc
                .collection('users')
                .doc(uid)
                .collection('calendar')
                .where('created_date', isEqualTo: createdDateInt + 1)
                .snapshots()
                .toList() as List;
            if (docList.isEmpty == true) {
              docList = calContent.getCalendarList();
              // ignore: avoid_print
              print(" calList in db service is called");
            }
          }

          return docList;
        } else {
          return docList;
        }
      });
    }
    if (dayChange == true) {
      createdDateInt + 1;
      return await calendarDoc
          .collection('users')
          .doc(uid)
          .collection('calendar')
          .doc('$createdDateInt')
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          docList = calendarDoc
              .collection('users')
              .doc(uid)
              .collection('calendar')
              .where('created_date', isEqualTo: createdDateInt)
              .snapshots()
              .toList() as List;

          return docList;
        } else {
          return docList;
        }
      });
    }
  }
}

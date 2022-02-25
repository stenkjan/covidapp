import 'dart:core';
import 'package:covidapp/Mozido/calendar_view/calendar.dart';
import 'package:covidapp/Mozido/content/calendar_content.dart';
import 'package:covidapp/Mozido/models/calendar_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidapp/Mozido/content/grafik_content.dart';

import 'package:flutter/cupertino.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});
  //collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference userCollectionData = 
      FirebaseFirestore.instance.collection('users');
  late CollectionReference calendarCollection;
  late DocumentReference calendarDoc;
  late List? docList;
  late List nameData;
  int registeredDate = 0;

  //db reference
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final CalendarContent calContent = CalendarContent();
  Future updateUserData(
      String email, String firstname, String lastname, String birthday) async {
    return await userCollection.doc(uid).set({
      'email': email,
      'firstname': firstname,
      'lastname': lastname,
      'birthday': birthday,
    });
  }

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
      // querySnapshot.docs.forEach((doc) {});
    });
  }

  /* String getName() {
    getUserData();
    List? userData = nameData;
    String firstname = userData![0].toString();
    String lastname = userData[1].toString();
    if (firstname == "" && lastname == "") {
      firstname = "Maximilian";
      lastname = "Stenk";
    }
    String name = firstname + " " + lastname;
    return name;
  } */

  Future getUserData() async {
    String name = "Maximilian Stenk";
    return await userCollection
        .doc(uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        nameData = userCollection.doc(uid).snapshots().toList() as List;
        if (documentSnapshot.exists == false) {
          nameData = userCollection.doc(uid).set({
            'email': 'stenkjan@gmail.com',
            'firstname': 'Maximilian',
            'lastname': 'Stenk',
            'birthday': '01/01/2000',
          }) as List;
        }
        name = nameData[0] + " " + nameData[1];
        return name;
      }
      return name;
    });
  }

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
              .toList() as List?;
          if (documentSnapshot.exists == false) {
            docList = calendarDoc
                .collection('users')
                .doc(uid)
                .collection('calendar')
                .where('created_date', isEqualTo: createdDateInt + 1)
                .snapshots()
                .toList() as List?;
            if (docList?.isEmpty == true) {
              docList = calContent.calList;
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
              .toList() as List?;

          return docList;
        } else {
          return docList;
        }
      });
    }
  }
/* Stream <List> getDoc (String createdDate){
  final Stream<QuerySnapshot> documents = FirebaseFirestore.instance.collection('users').doc(uid).collection('calendar').snapshots();

  return documents.map((querySnapshot) {
    List listDoc;
    final documents = querySnapshot.documents;

    listDoc = documents.map((documentSnapshot) => documentSnapshot['create_date']);

    return docList;
  });

} */ /* 
  Future<GrafikContent> getGrafikModel(
      String mood,
      String muedigkeit,
      String atemnot,
      String sinne,
      String herz,
      String schlaf,
      String nerven,
      String comment,
      String createdDate) async {
    return await 
        .doc(uid)
        .collection('calendar')
        .doc(createdDate)
        .get({
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
  } */

}
  // Future<CalendarModel> getCalenderModel(String id) async {
  //   var snap = await _db.collection('calendar').document(id).get();

  //return CalendarModel.fromMap(snap.data);
  // }


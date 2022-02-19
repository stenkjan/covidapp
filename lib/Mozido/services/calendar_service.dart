import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidapp/Mozido/content/calendar_content.dart';
import 'package:covidapp/Mozido/models/calendar_models.dart';
import 'package:covidapp/Mozido/models/user_models.dart';
import 'package:covidapp/Mozido/services/db_service.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/services.dart';

class CalendarService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  auth.User? user;

  Future<CalendarModel?> dailyTask(
      String mood,
      String muedigkeit,
      String atemnot,
      String sinne,
      String herz,
      String schlaf,
      String nerven,
      String comment,
      String createdDate) async {
    try {
      //create a new user doc with uid
      await DatabaseService(uid: user!.uid).updateCalendarModel(
          mood,
          muedigkeit,
          atemnot,
          sinne,
          herz,
          schlaf,
          nerven,
          comment,
          createdDate);
    } catch (collectionError) {
      if (collectionError is PlatformException) {
        if (collectionError.code == '') {
          /// Es ist ein Fehler aufgetreten
        }
      }
    }
  }
}

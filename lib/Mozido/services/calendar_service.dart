import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidapp/Mozido/calendar_view/calendar.dart';
import 'package:covidapp/Mozido/content/calendar_content.dart';
import 'package:covidapp/Mozido/models/calendar_models.dart';
import 'package:covidapp/Mozido/services/auth_service.dart';
import 'package:covidapp/Mozido/services/db_service.dart';
import 'package:covidapp/Mozido/services/grafik_service.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class CalendarService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  AuthService auth = AuthService();

  GrafikService grafService = GrafikService();

/**Variables for Firebase */
  Future<CalendarContent?> dailyTask(
      int mood,
      int muedigkeit,
      int atemnot,
      int sinne,
      int herz,
      int schlaf,
      int nerven,
      String comment,
      int createdDate) async {
    try {
      String uid = auth.getUser();
      //create a new user doc with uid
      await DatabaseService(uid: uid).updateCalendarModel(mood, muedigkeit,
          atemnot, sinne, herz, schlaf, nerven, comment, createdDate);
      print(uid + '  updateCalInitiated');
      print(mood.toString() + ' mood value on DB');
    } catch (collectionError) {
      print(auth.getUser() + ' update CalendarModel uid exception');
      if (collectionError is PlatformException) {
        print(auth.getUser() + ' update CalendarModel uid exception');
        if (collectionError.code == 'Collection Error') {
          /// Es ist ein Fehler aufgetreten
        }
      }
    }
  }
}

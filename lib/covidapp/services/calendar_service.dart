// ignore_for_file: avoid_print

import 'package:covidapp/covidapp/content/calendar_content.dart';
import 'package:covidapp/covidapp/services/auth_service.dart';
import 'package:covidapp/covidapp/services/db_service.dart';
import 'package:covidapp/covidapp/services/grafik_service.dart';
import 'package:flutter/services.dart';

class CalendarService {
  AuthService auth = AuthService();

  GrafikService grafService = GrafikService();

/// Variables for Firebase */
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
      print('$uid  Calendar updateCalInitiated');
     
    } catch (collectionError) {
      print('${auth.getUser()} update CalendarModel uid exception');
      if (collectionError is PlatformException) {
        print('${auth.getUser()} update CalendarModel uid exception');
        if (collectionError.code == 'Collection Error') {
          /// Es ist ein Fehler aufgetreten
        }
      }
    }
    return null;
  }
}

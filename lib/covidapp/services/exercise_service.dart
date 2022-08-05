// ignore_for_file: avoid_print

import 'package:covidapp/covidapp/content/calendar_content.dart';
import 'package:covidapp/covidapp/services/auth_service.dart';
import 'package:covidapp/covidapp/services/db_service.dart';
import 'package:covidapp/covidapp/services/grafik_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExerciseService {
  AuthService auth = AuthService();

  GrafikService grafService = GrafikService();
 final GlobalKey<NavigatorState> breatheKey = GlobalKey<NavigatorState>();

  /// Variables for Firebase */
  Future<CalendarContent?> dailyBreatheExercise(
      var breathemin, var breathesec) async {
    try {
      String uid = auth.getUser();
      //create a new user doc with uid
      await DatabaseService(uid: uid)
          .updateBreatheMinExerciseModel(breathemin);
      await DatabaseService(uid: uid)
          .updateBreatheMinExerciseModel(breathesec);

      print('$uid  Exercise updateCalInitiated');
    } catch (collectionError) {
      print('${auth.getUser()} update CalendarModel exception');
      if (collectionError is PlatformException) {
        print('${auth.getUser()} update CalendarModel exception');
        if (collectionError.code == 'Collection Error') {
          /// Es ist ein Fehler aufgetreten
          print('${auth.getUser()} collection error');
        }
      }
    }
    return null;
  }

  Future<CalendarContent?> dailyPulseExercise(var pulse) async {
    try {
      String uid = auth.getUser();
      //create a new user doc with uid
      await DatabaseService(uid: uid).updatePulseExerciseModel(pulse);
      print('$uid  Exercise updateCalInitiated, var $pulse');
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

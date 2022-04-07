import 'package:covidapp/covidapp/content/grafik_content.dart';
import 'package:covidapp/covidapp/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:covidapp/covidapp/services/db_service.dart';
import 'package:flutter/services.dart';

class GrafikService {
  String? uid;
  AuthService authService = AuthService();
  auth.User? user;
  late final DatabaseService dbS;
  List? docList;
/// connector to DB for reading doc daily
  Future<GrafikContent?> dailyRead(
    int createdDate,
    bool dayChange,
  ) async {
    try {
      uid = authService.getUser();
      dbS = DatabaseService(uid: user!.uid);
      docList = dbS.docList;
      // ignore: avoid_print
      print('${uid!} db');
      //create a new user doc with uid
      await dbS.readcalendarDocDaily(createdDate, dayChange);
    } catch (collectionError) {
      if (collectionError is PlatformException) {
        if (collectionError.code == 'Error') {
          /// Es ist ein Fehler aufgetreten
        }
      }
    }
    return null;
  }
}

     
      
    


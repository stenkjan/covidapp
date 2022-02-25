import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidapp/Mozido/content/grafik_content.dart';
import 'package:covidapp/Mozido/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:covidapp/Mozido/services/db_service.dart';
import 'package:flutter/services.dart';

class GrafikService {
  String? uid;
  AuthService authService = AuthService();
  auth.User? user;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  late final DatabaseService dbS;
  List? docList;

  Future<GrafikContent?> dailyRead(
    int createdDate,
    bool dayChange,
  ) async {
    try {
      uid = authService.getUser();
      dbS = DatabaseService(uid: user!.uid);
      docList = dbS.docList;
      print(uid! + ' db');
      //create a new user doc with uid
      await dbS.readcalendarDocDaily(createdDate, dayChange);
    } catch (collectionError) {
      if (collectionError is PlatformException) {
        if (collectionError.code == 'Error') {
          /// Es ist ein Fehler aufgetreten
        }
      }
    }
  }
}

     /* final FirebaseFirestore.instance.collection('calendar').snapshots();

  
        snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return ListTile(
              title: Text(data['full_name']),
              subtitle: Text(data['company']),
            );
          }).toList(),
        ); */
      
    


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidapp/Mozido/content/grafik_content.dart';
import 'package:covidapp/Mozido/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:covidapp/Mozido/services/db_service.dart';
import 'package:flutter/services.dart';

class GrafikService {
   final String uid;
    GrafikService({required this.uid});
  auth.User? user;
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  late final DatabaseService dbS;
  late Future<List> docList;
 
  Future<GrafikContent?> dailyRead(
    int createdDate,
    bool dayChange,
  ) async {
    try {
      dbS = DatabaseService(uid: user!.uid);
      //create a new user doc with uid
      await dbS.readcalendarDocDaily(createdDate, dayChange);
      docList == dbS.docList;
    } catch (collectionError) {
      if (collectionError is PlatformException) {
        if (collectionError.code == '') {
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
      
    


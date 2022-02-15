import 'package:covidapp/Mozido/models/calendar_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});
  //collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference calendarCollection =
      FirebaseFirestore.instance.collection('calendar');

  //db reference
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future updateUserData(
      String email, String firstname, String lastname, String birthday) async {
    return await userCollection.doc(uid).set({
      'email': email,
      'firstname': firstname,
      'lastname': lastname,
      'birthday': birthday,
    });
  }

  Future updateCalendarModel(String mood, String muedigkeit, String atemnot,
      String sinne, String herz, String schlaf) async {
    return await calendarCollection.doc(uid).set({
      'id': uid,
      'mood': mood,
      'muedigkeit': muedigkeit,
      'atemnot': atemnot,
      'sinne': sinne,
      'herz': herz,
      'schlaf': schlaf,
    });
  }
  // Future<CalendarModel> getCalenderModel(String id) async {
  //   var snap = await _db.collection('calendar').document(id).get();

  //return CalendarModel.fromMap(snap.data);
  // }
}

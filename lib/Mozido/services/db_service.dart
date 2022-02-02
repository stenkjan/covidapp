import 'package:covidapp/Mozido/models/calendar_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Future<CalendarModel> getCalenderModel(String id) async {
  //   var snap = await _db.collection('calendar').document(id).get();

  //return CalendarModel.fromMap(snap.data);
  // }
}

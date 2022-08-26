import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:covidapp/covidapp/content/calendar_content.dart';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart';

class ExerciseData extends StatelessWidget {
  final String exerciseString;
  ExerciseData(this.exerciseString);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> dataExample = {
      for (var i = 0; i < 8; i++) i.toString(): 1
    };

    AuthService auth = Provider.of<AuthService>(context);
    final calContent = Provider.of<CalendarContent>(context);
    final CollectionReference calCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(auth.getUser())
        .collection('exercise');

    return FutureBuilder<DocumentSnapshot>(
        future: calCollection.doc(exerciseString).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            if (exerciseString == "breathemin") {
              calContent.breatheGraphMinL(breatheData(dataExample));
            }
            if (exerciseString == "breathesec") {
              calContent.breatheGraphSecL(breathesecData(dataExample));
            }
            if (exerciseString == "pulse") {
              calContent.pulseGraphL(pulseData(dataExample));
            }
            return const Padding(
              padding: EdgeInsets.only(left: 100.0),
              child: Text("Error"),
            );
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            if (exerciseString == "breathemin") {
              calContent.breatheGraphMinL(breatheData(dataExample));
            }
            if (exerciseString == "breathesec") {
              calContent.breatheGraphSecL(breathesecData(dataExample));
            }
            if (exerciseString == "pulse") {
              calContent.pulseGraphL(pulseData(dataExample));
            }
            return const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(""),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            if (exerciseString == "breathemin") {
              calContent.breatheGraphMinL(breatheData(data));
            }
            if (exerciseString == "breathesec") {
              calContent.breatheGraphSecL(breathesecData(data));
            }
            if (exerciseString == "pulse") {
              calContent.updatebpmDay(pulseData(data));
              calContent.pulseGraphL(pulseData(data));
            }
            /* if (exerciseString == "pulse") {
            calContent.pulseGraphL(pulseData(data));
          } */
          }

          return const Padding(
            padding: EdgeInsets.only(left: 288.0, top: 50),
            child: SizedBox(
                height: 20, width: 20, child: CircularProgressIndicator()),
          );
        });
  }

  List<double> breatheData(Map<String, dynamic> data) {
    List<double> doubleData = [];
    for (int index = 0; index < 32; index++) {
      if (data[index.toString()] != null) {
        doubleData.add(double.parse(data[index.toString()].toString()));
      } else if (data[index.toString()] == null) {
        doubleData.add(0);
      }
    }
    return doubleData;
  }

  List<double> breathesecData(Map<String, dynamic> data) {
    List<double> doubleData = [];
    for (int index = 0; index < 32; index++) {
      if (data[index.toString()] != null) {
        doubleData.add(double.parse(data[index.toString()].toString()));
      } else if (data[index.toString()] == null) {
        doubleData.add(0);
      }
    }
    return doubleData;
  }

  List<double> pulseData(Map<String, dynamic> data) {
    List<double> doubleData = [];
    for (int index = 0; index < 32; index++) {
      if (data[index.toString()] != null) {
        doubleData.add(double.parse(data[index.toString()].toString()));
      } else if (data[index.toString()] == null) {
        doubleData.add(0);
      }
    }
    return doubleData;
  }
}

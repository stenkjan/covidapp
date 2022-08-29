import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final db = FirebaseFirestore.instance;
List<List<String>> itemList = [];
List<String> user = [
  "IJWaAl0TlDgrab5vMKY9BKetxBa2", //ma
  "LWTXyeZWKrUap8T1dzNJ8AeS9fr2", //mat
  "cQXVdiyfGJeQK2AXQecUBibi9ZH3", //ro
  "RTxndylZhpVm1YNjRCVpbMUdYnP2", //ni
  "rpyUKF1asVOiHNN4MGNKrKfKViI2", //se
  "OJX8NuVA7pOeAPVSObKFZa3PTvN2" //ne
];

class ItemScreenExport extends StatefulWidget {
  const ItemScreenExport({Key? key}) : super(key: key);

  @override
  ItemScreenExportState createState() => ItemScreenExportState();
}

class ItemScreenExportState extends State<ItemScreenExport> {
  Stream<QuerySnapshot> streamQuery1 =
      db.collection('users').doc(user[0]).collection('calendar').snapshots();
  Stream<QuerySnapshot> streamQuery2 =
      db.collection('users').doc(user[1]).collection('calendar').snapshots();
  Stream<QuerySnapshot> streamQuery3 =
      db.collection('users').doc(user[2]).collection('calendar').snapshots();
  Stream<QuerySnapshot> streamQuery4 =
      db.collection('users').doc(user[3]).collection('calendar').snapshots();
  Stream<QuerySnapshot> streamQuery5 =
      db.collection('users').doc(user[4]).collection('calendar').snapshots();
  Stream<QuerySnapshot> streamQuery6 =
      db.collection('users').doc(user[5]).collection('calendar').snapshots();

  @override
  void initState() {
    super.initState();
    itemList = [
      <String>["muedigkeit", "atemnot", "sinne", "herz", "schlaf", "nerven"]
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
    /*  return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: streamQuery1,
        builder: (context, snapshot) {
          if (!snapshot.hasData){
            return Text("");
          }
          else {
            return Container(alignment: Alignment.center,
            child: Column(
              children:[
                Expanded(child: ListView.builder(itemCount: snapshot.data!.docs.length, itemBuilder: (context,index){
                  DocumentSnapshot doc = snapshot.data!.docs[index];

                  itemList.add<String>[doc.get('muedigkeit'), doc.get('atemnot'), doc.get('sinne'), doc.get('herz'), doc.get('schlaf'), doc.get('nerven')];
                }))
              ] ,),);

          }
        }
      ),
      },
    ); */
  }
}

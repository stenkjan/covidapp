import 'dart:convert';
import 'package:covidapp/Mozido/calendar_view/T2_Kalender.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class T2_Calendar extends StatefulWidget {

  T2_Calendar({Key? key}) : super(key: key);

_T2_CalendarState createState() => _T2_CalendarState();
  }

  class _T2_CalendarState extends State<T2_Calendar> {

    late CalendarController _controller;
    late Map<DateTime, List<dynamic>> _events;
    late List<dynamic> _selectedEvents;
    late TextEditingController _eventController;
    late SharedPreferences prefs;
    late T2Kalender t2kalender;
    @override
    void initState() {
      super.initState();
      _controller = CalendarController();
      _eventController = TextEditingController();
      _events = {};
      _selectedEvents = [];
      prefsData();
    }

    prefsData() async {
      prefs = await SharedPreferences.getInstance();
      setState(() {
        _events = Map<DateTime, List<dynamic>>.from(
            decodeMap(json.decode(prefs.getString("Ereignisse") ?? "{}")));
      });
    }

    Map<String, dynamic> encodeMap(Map<DateTime, dynamic> map) {
      Map<String, dynamic> newMap = {};
      map.forEach((key, value) {
        newMap[key.toString()] = map[key];
      });
      return newMap;
    }
    Map<DateTime, dynamic> decodeMap(Map<String, dynamic> map) {
      Map<DateTime, dynamic> newMap = {};
      map.forEach((key, value) {
        newMap[DateTime.parse(key)] = map[key];
      });
      return newMap;
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
    body:
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TableCalendar(
                  events: _events,
                  initialCalendarFormat: CalendarFormat.week,
                  calendarStyle: CalendarStyle(
                      canEventMarkersOverflow: true,
                      todayColor: Colors.orange,
                      selectedColor: Theme.of(context).primaryColor,
                      todayStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.white)),
                  headerStyle: HeaderStyle(
                    centerHeaderTitle: true,
                    formatButtonDecoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    formatButtonTextStyle: TextStyle(color: Colors.white),
                    formatButtonShowsNext: false,
                  ),
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  onDaySelected: (date, events,holidays) {
                    setState(() {
                      _selectedEvents = events;
                    });
                  },
                  builders: CalendarBuilders(
                    selectedDayBuilder: (context, date, events) => Container(
                        margin: const EdgeInsets.all(4.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Text(
                          date.day.toString(),
                          style: TextStyle(color: Colors.white),
                        )),
                    todayDayBuilder: (context, date, events) => Container(
                        margin: const EdgeInsets.all(4.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Text(
                          date.day.toString(),
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  calendarController: _controller,
                ),
                ..._selectedEvents.map((event) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height/20,
                    width: MediaQuery.of(context).size.width/2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey)
                    ),
                    child: Center(
                        child: Text(event,
                          style: TextStyle(color: Colors.blue,
                              fontWeight: FontWeight.bold,fontSize: 16),)
                    ),
                  ),
                )),

              ],
            ),
          ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: Icon(Icons.add),
          onPressed:
          showAddDialog,
        ),

      );
    }

    showAddDialog() async {
      await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Colors.white70,
            title: Text("Dateneingabe"),
            content:
                  //  Text(
                  //text: calenderChoices
            TextField(
              decoration: InputDecoration(
              labelText: t2kalender.question_choice,
                hintText: "Bitte geben Sie einen Kommentar ein",
              ),
              controller: _eventController,
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("Speichern",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                onPressed: () {
                  if (_eventController.text.isEmpty) return;
                  setState(() {
                    if (_events[_controller.selectedDay] != null) {
                      _events[_controller.selectedDay]!
                          ..add( t2kalender.question_choice)
                          ..add(_eventController.text);


                    } else {
                      _events[_controller.selectedDay] = [
                        _eventController.text
                      ];
                    }
                    prefs.setString("Ereignisse", json.encode(encodeMap(_events)));
                    _eventController.clear();
                    Navigator.pop(context);
                  });



                },
              )
            ],
          ));
    }
  }


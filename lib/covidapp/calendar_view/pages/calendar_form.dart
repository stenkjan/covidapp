import 'package:covidapp/covidapp/calendar_view/calendar.dart';

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:table_calendar/table_calendar.dart';
import 'package:get/utils.dart';
// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'basics_example.dart';
import 'complex_example.dart';
import 'events_example.dart';
import 'multi_example.dart';
import 'range_example.dart';


class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TableCalendar Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20.0),
            ElevatedButton(
              child: Text('Basics'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => TableBasicsExample()),
              ),
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
              child: Text('Range Selection'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => TableRangeExample()),
              ),
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
              child: Text('Events'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => TableEventsExample()),
              ),
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
              child: Text('Multiple Selection'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => TableMultiExample()),
              ),
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
              child: Text('Complex'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => TableComplexExample()),
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

/* class CalendarForm extends StatefulWidget {
  const CalendarForm({Key? key}) : super(key: key);

  @override
  _CalendarFormState createState() => _CalendarFormState();
}

//build Calendar and display @calContent.comment
class _CalendarFormState extends State<CalendarForm> {
 /*  late CalendarController _controller; */
  late Map<DateTime, List<dynamic>> _events;
  late List<dynamic> _selectedEvents;
  late TextEditingController _eventController;
  late SharedPreferences prefs;
  late Calendar calendar;
  late bool comBool;
  late int index;
  Color colorsum = Colors.blue;

  @override
  void initState() {
 /*    _controller = CalendarController(); */
    _eventController = TextEditingController();
    _events = {};
    _selectedEvents = [];
    prefsData();
    comBool = false;
    index = 0;

    colorsum = calContent.getCalendarColorSum();
    _eventController.clear();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0)),
          gradient: LinearGradient(
            colors: [Color(0xFF31A1C9), Color(0xFF3DB6D4)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
               firstDay: DateTime.utc(2010, 10, 16),
  lastDay: DateTime.utc(2030, 3, 14),
  focusedDay: DateTime.now(),
              events: _events,
              initialCalendarFormat: CalendarFormat.week,
              calendarStyle: CalendarStyle(
                canEventMarkersOverflow: true,
                todayColor: const Color(0x9C2D00A7),
                selectedColor: colorsum,
                todayStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Color.fromARGB(234, 212, 246, 255)),
              ),
              headerStyle: HeaderStyle(
                centerHeaderTitle: true,
                formatButtonDecoration: BoxDecoration(
                  color: const Color(0xFF363940),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                formatButtonTextStyle: const TextStyle(color: Colors.white),
                formatButtonShowsNext: false,
              ),
              startingDayOfWeek: StartingDayOfWeek.monday,
              onDaySelected: (date, events, holidays) {
                _selectedEvents = events;

                setState(() {
                  if (calContent.docExists) {
                    comBool = true;
                    calContent.pieLegendbool = false;
                  } else {
                    if (calContent.dateL
                        .contains(_controller.selectedDay.day.toInt())) {
                      calContent.indexGrafik = calContent.dateL
                          .indexOf(_controller.selectedDay.day.toInt());
                      if (calContent.indexGrafik != 0) {
                        index = calContent.indexGrafik;
                      }
                      comBool = true;
                    }
                  }
                  if (_events[_controller.selectedDay] != null) {
                    if (_events[_controller.selectedDay]?.last !=
                        calContent.comment) {
                      if (calContent.comment != "") {
                        _events[_controller.selectedDay]!
                            .add(calContent.comment);
                      }
                    }
                  } else {
                    comBool = false;
                  }
                  prefs.setString(
                      "Ereignisse", json.encode(encodeMap(_events)));
                  _eventController.clear();
                });
              },
              builders: CalendarBuilders(
                selectedDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0x85171F4D), Color(0xC6305264)],
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft,
                        ),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(
                      date.day.toString(),
                      style: const TextStyle(color: Colors.white),
                    )),
                todayDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: const Color(0x9C2D00A7),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(
                      date.day.toString(),
                      style: const TextStyle(color: Colors.white),
                    )),
              ),
             
            ),
            ..._selectedEvents.map((event) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 20,
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: const LinearGradient(
                          colors: [Color(0xFF363940), Color(0xFF2E4E57)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                          )
                        ]),
                    child: Column(
                      children: [
                        Center(
                            child: Text(
                          event,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )),
                      ],
                    ),
                  ),
                )),
            Visibility(visible: comBool, child: DayPiePeek(index)),
          ],
        ),
      ),
    );
  } */
}

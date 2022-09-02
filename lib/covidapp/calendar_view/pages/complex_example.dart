// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidapp/covidapp/calendar_view/pages/utils.dart';
import 'package:covidapp/covidapp/content/strings.dart';
import 'package:covidapp/covidapp/services/auth_service.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../content/calendar_content.dart';
import '../widgets/daily_pie_peek.dart';

// ignore: use_key_in_widget_constructors
class TableComplexExample extends StatefulWidget {
  @override
  TableComplexExampleState createState() => TableComplexExampleState();
}

class TableComplexExampleState extends State<TableComplexExample> {
  // ignore: unused_field
  late CollectionReference calCollection;
  // ignore: unused_field
  late final PageController _pageController;
  late final ValueNotifier<List<Event>> _selectedEvents;
  final ValueNotifier<DateTime> _focusedDay = ValueNotifier(DateTime.now());
  final Set<DateTime> _selectedDays = LinkedHashSet<DateTime>(
    equals: isSameDay,
    hashCode: getHashCode,
  );
  CalendarFormat _calendarFormat = CalendarFormat.week;

  @override
  void initState() {
    super.initState();

    _selectedDays.add(_focusedDay.value);
    _selectedEvents = ValueNotifier(_getEventsForDay(_focusedDay.value));
    calContent.fireDate = _focusedDay.value.day.toString();
  }

  @override
  void dispose() {
    _focusedDay.dispose();
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForDays(Iterable<DateTime> days) {
    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      if (_selectedDays.contains(selectedDay)) {
        _selectedDays.remove(selectedDay);
      } else {
        _selectedDays.add(selectedDay);
      }
      _focusedDay.value = focusedDay;
      calContent.fireDate = _focusedDay.value.day.toString();
    });

    _selectedEvents.value = _getEventsForDays(_selectedDays);
  }

  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);
    final calContent = Provider.of<CalendarContent>(context);
    if (calContent.fireDate == "") {
      calContent.fireDate = _focusedDay.value.day.toString();
    }
    calCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(auth.getUser())
        .collection('calendar');
    return Container(
      width: 370,
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
      child: Column(children: [
        TableCalendar<Event>(
          locale: 'de_DE',
          firstDay: DateTime(
              kToday.year, kToday.month, int.parse(calContent.getCalDay())),
          lastDay: DateTime(
              kToday.year,
              kToday.month + 1,
              int.parse(calContent.getsickDays()) +
                  (31 - int.parse(calContent.getsickDays()))),
          focusedDay: _focusedDay.value,
          headerVisible: true,
          calendarStyle: const CalendarStyle(
            todayDecoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(228, 250, 59, 59),
                  Color.fromARGB(169, 80, 3, 3),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            selectedDecoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(135, 180, 221, 31),
                  Color.fromARGB(255, 2, 88, 35)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape: BoxShape.circle,
            ),
          ),
          availableCalendarFormats: const {
            CalendarFormat.month: 'Monat',
            CalendarFormat.twoWeeks: '2 Wochen',
            CalendarFormat.week: 'Woche'
          },
          headerStyle: HeaderStyle(
            formatButtonShowsNext: true,
            titleTextFormatter: (date, locale) =>
                DateFormat.yMMM(locale).format(date),
            formatButtonDecoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.1),
                  offset: const Offset(-6.0, -6.0),
                  blurRadius: 16.0,
                ),
                BoxShadow(
                  color: Colors.black54.withOpacity(0.4),
                  offset: const Offset(6.0, 6.0),
                  blurRadius: 16.0,
                ),
              ],
              color: const Color(0xFF292D32),
              borderRadius: BorderRadius.circular(12.0),
            ),
            headerMargin: const EdgeInsets.all(8),
            titleTextStyle: const TextStyle(
              color: Colors.white70,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              wordSpacing: 2.0,
              shadows: <Shadow>[
                Shadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 3.0,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                Shadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 8.0,
                  color: Color.fromARGB(124, 184, 184, 185),
                ),
              ],
            ),
            formatButtonTextStyle: const TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
            decoration: const BoxDecoration(
              color: Color(0xFF31A1C9),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(123, 49, 160, 201),
                  spreadRadius: 4,
                  blurRadius: 8,
                  offset: Offset(1, 0), // changes position of shadow
                ),
              ],
            ),
          ),
          pageJumpingEnabled: false,
          selectedDayPredicate: (day) => isSameDay(_selectedDays.last, day),
          calendarFormat: _calendarFormat,
          eventLoader: _getEventsForDay,
          onDaySelected: _onDaySelected,
          onCalendarCreated: (controller) => _pageController = controller,
          onPageChanged: (focusedDay) => _focusedDay.value = focusedDay,
          onFormatChanged: (format) {
            if (_calendarFormat != format) {
              setState(() => _calendarFormat = format);
            }
          },
        ),
        const SizedBox(height: 5.0),
        FutureBuilder<DocumentSnapshot>(
            future: calCollection.doc(_focusedDay.value.day.toString()).get(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return Container(
                    height: 40,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 4.0,
                    ),
                    child: Neumorphic(
                      style: NeumorphicStyle(
                          shape: NeumorphicShape.concave,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(12)),
                          depth: 15,
                          intensity: 3.0,
                          shadowLightColor: Colors.transparent,
                          color: const Color(0xFF31A1C9)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Irgendwas ist schief gelaufen",
                            textAlign: TextAlign.center,
                          ),
                          IconButton(
                            icon: const Icon(Icons.replay_outlined),
                            onPressed: () => TableComplexExample(),
                          ),
                        ],
                      ),
                    ));
              }

              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.data!.exists) {
                calContent.spoofCheck = false;
                calContent.calTrue = true;
                Map<String, dynamic> data =
                    snapshot.data!.data() as Map<String, dynamic>;
                calContent.dayliepieMap(data, _focusedDay.value.day);

                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 4.0,
                  ),
                  child: Neumorphic(
                    style: NeumorphicStyle(
                        shape: NeumorphicShape.concave,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(12)),
                        depth: 15,
                        intensity: 3.0,
                        shadowLightColor: Colors.transparent,
                        color: const Color(0xFF31A1C9)),
                    child: SizedBox(
                      height: 85,
                      child: ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Text('${_focusedDay.value.day}.',
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              )),
                        ),
                        subtitle: Container(
                          margin: const EdgeInsets.only(
                            bottom: 2,
                          ),
                          height: 85,
                          width: 85,
                          child: DayPiePeek(
                              _focusedDay.value.day,
                              calContent.getLevel(calContent
                                  .sumColorList[_focusedDay.value.day]
                                  .round())),
                          // ignore: avoid_print
                        ),
                      ),
                    ),
                  ),
                );
              }

              if (snapshot.connectionState == ConnectionState.done &&
                  !snapshot.data!.exists) {
                calContent.spoofCheck = true;
              }

              calContent.daypiedataMapCalendar(_focusedDay.value.day);

              return Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 4.0,
                ),
                child: Neumorphic(
                  style: NeumorphicStyle(
                      shape: NeumorphicShape.concave,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(12)),
                      depth: 15,
                      intensity: 3.0,
                      shadowLightColor: Colors.transparent,
                      color: const Color(0xFF31A1C9)),
                  child: Stack(
                    children: [
                      Visibility(
                        visible: calContent.spoofCheck,
                        child: Container(
                            alignment: Alignment.topCenter,
                            height: 18,
                            width: 350,
                            margin: const EdgeInsets.only(
                              top: 1,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromARGB(255, 19, 221, 235)
                                      .withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 8,
                                  offset: const Offset(
                                      0, 0), // changes position of shadow
                                ),
                              ],
                            ),
                            child: const Text(
                              "Für diesen Tag liegen noch keine Ergebnisse vor.",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                              ),
                            )),
                      ),
                      Container(
                        height: 120,
                        margin: const EdgeInsets.only(
                          right: 12.0,
                          top: 25.0,
                        ),
                        child: ListTile(
                          leading: Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Text('${_focusedDay.value.day}.',
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                )),
                          ),
                          subtitle: Container(
                            margin: const EdgeInsets.only(
                              bottom: 25,
                            ),
                            height: 110,
                            width: 110,
                            child: DayPiePeek(
                                _focusedDay.value.day,
                                calContent.getLevel(calContent
                                    .sumColorList[_focusedDay.value.day]
                                    .round())),
                            // ignore: avoid_print
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            })
      ]),
    );
  }
}

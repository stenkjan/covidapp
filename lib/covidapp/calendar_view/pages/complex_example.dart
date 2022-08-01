// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'dart:collection';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidapp/covidapp/calendar_view/pages/utils.dart';
import 'package:covidapp/covidapp/content/strings.dart';
import 'package:covidapp/covidapp/services/auth_service.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../content/calendar_content.dart';
import '../../services/grafik_service.dart';
import '../widgets/daily_pie_peek.dart';

// ignore: use_key_in_widget_constructors
class TableComplexExample extends StatefulWidget {
  @override
  TableComplexExampleState createState() => TableComplexExampleState();
}

class TableComplexExampleState extends State<TableComplexExample> {
  // ignore: unused_field
  late CollectionReference calCollection;
  late final PageController _pageController;
  late final ValueNotifier<List<Event>> _selectedEvents;
  final ValueNotifier<DateTime> _focusedDay = ValueNotifier(DateTime.now());
  final Set<DateTime> _selectedDays = LinkedHashSet<DateTime>(
    equals: isSameDay,
    hashCode: getHashCode,
  );
  CalendarFormat _calendarFormat = CalendarFormat.week;
  /*  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode.toggledOff; */
/*   DateTime? _rangeStart;
  DateTime? _rangeEnd; */

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

  /* bool get canClearSelection =>
      _selectedDays.isNotEmpty || _rangeStart != null || _rangeEnd != null; */

  List<Event> _getEventsForDay(DateTime day) {
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForDays(Iterable<DateTime> days) {
    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

/*   List<Event> _getEventsForRange(DateTime start, DateTime end) {
    final days = daysInRange(start, end);
    return _getEventsForDays(days);
  }
 */
  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      if (_selectedDays.contains(selectedDay)) {
        _selectedDays.remove(selectedDay);
      } else {
        _selectedDays.add(selectedDay);
      }
      _focusedDay.value = focusedDay;
      calContent.fireDate = _focusedDay.value.day.toString();

      /*   _rangeStart = null;
      _rangeEnd = null;
      _rangeSelectionMode = RangeSelectionMode.toggledOff; */
    });

    _selectedEvents.value = _getEventsForDays(_selectedDays);
  }

  /*  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _focusedDay.value = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _selectedDays.clear();
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    }); */

/*     if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  } */

  @override
  Widget build(BuildContext context) {
    final grafService = Provider.of<GrafikService>(context);
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
        /*  ValueListenableBuilder<DateTime>(
              valueListenable: _focusedDay,
              builder: (context, value, _) {
                return _CalendarHeader(
                  focusedDay: value,
                  clearButtonVisible: canClearSelection,
                  onTodayButtonTap: () {
                    setState(() => _focusedDay.value = DateTime.now());
                  },
                  
                 
                  onClearButtonTap: () {
                    setState(() {
                      _rangeStart = null;
                      _rangeEnd = null;
                      _selectedDays.clear();
                      _selectedEvents.value = [];
                    });
                  },
                  onLeftArrowTap: () {
                    _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  },
                  onRightArrowTap: () {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  },
                );
              },
            ), */
        TableCalendar<Event>(
          locale: 'de_DE',
          firstDay: kFirstDay,
          lastDay: kLastDay,
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
          // _selectedDays.contains(day),
          /*  rangeStartDay: _rangeStart,
              rangeEndDay: _rangeEnd,
              calendarFormat: _calendarFormat,
              rangeSelectionMode: _rangeSelectionMode, */
          eventLoader: _getEventsForDay,
          /*   holidayPredicate: (day) {
                // Every 20th day of the month will be treated as a holiday
                return day.day == 20;
              }, */
          onDaySelected: _onDaySelected,
          /* onRangeSelected: _onRangeSelected, */
          onCalendarCreated: (controller) => _pageController = controller,
          onPageChanged: (focusedDay) => _focusedDay.value = focusedDay,
          onFormatChanged: (format) {
            if (_calendarFormat != format) {
              setState(() => _calendarFormat = format);
            }
          },
        ),
        const SizedBox(height: 5.0),
        /*   ValueListenableBuilder<List<Event>>(
            valueListenable: _selectedEvents,
            builder: (context, value, _) {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return */
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
                          /*  lightSource: LightSource.topLeft, */
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

              /*    if (snapshot.hasData && !snapshot.data!.exists) {
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
                            /*  lightSource: LightSource.topLeft, */
                            color: const Color(0xFF31A1C9)),
                        child: Row(
                          children: [
                            const Text("Dokument existiert nicht",
                                textAlign: TextAlign.center),
                            IconButton(
                              icon: const Icon(Icons.replay_outlined),
                              onPressed: () => TableComplexExample(),
                            )
                          ],
                        )));
              } */

              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.data!.exists) {
                calContent.spoofCheck = false;
                calContent.calTrue = true;
                Map<String, dynamic> data =
                    snapshot.data!.data() as Map<String, dynamic>;
                calContent.dayliepieMap(data, _focusedDay.value.day);
                /* calContent.listSum(data); */
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
                        /*  lightSource: LightSource.topLeft, */
                        color: const Color(0xFF31A1C9)),
                    /*  decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(12.0),
                        ), */

                    child: SizedBox(
                      height: 85,
                      /*  margin: const EdgeInsets.only(
                        right: 12.0,
                        top: 20.0,
                      ), */
                      child: ListTile(
                        leading: Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Text('${_focusedDay.value.day}.',
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                /* calContent.getLevel(calContent
                                          .sumColorList[_focusedDay.value.day]) */
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
                        /*     onTap: () => print('${value[index]}'), */
                      ),
                    ),
                  ),
                );
              }

              if (snapshot.connectionState == ConnectionState.done &&
                  !snapshot.data!.exists) {
                calContent.spoofCheck = true;
              }

              /*  return Container(
                  height: 40,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 4.0,
                  ),
                  child: Neumorphic(
                      margin: const EdgeInsets.all(1.0),
                      style: NeumorphicStyle(
                          shape: NeumorphicShape.concave,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(12)),
                          depth: 15,
                          intensity: 3.0,
                          shadowLightColor: Colors.transparent,
                          /*  lightSource: LightSource.topLeft, */
                          color: const Color(0xFF31A1C9)),
                      child: Container(
                          height: 35,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 4.0,
                          ),
                          child: const Text("laden...")))); */

              calContent.daypiedataMapCalendar(_focusedDay.value.day);

              /* calContent.listSum(data); */
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
                      /*  lightSource: LightSource.topLeft, */
                      color: const Color(0xFF31A1C9)),
                  /*  decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(12.0),
                        ), */

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
                                  color: Color.fromARGB(255, 19, 221, 235)
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
                                  /* calContent.getLevel(calContent
                                              .sumColorList[_focusedDay.value.day]) */
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
                          /*   onTap: () => print('${value[index]}'), */
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
           /*   );
            },
          )
        ],
      ),
    );
} */


/* class _CalendarHeader extends StatelessWidget {
  final DateTime focusedDay;
  final VoidCallback onLeftArrowTap;
  final VoidCallback onRightArrowTap;
  final VoidCallback onTodayButtonTap;
  final VoidCallback onClearButtonTap;

  final bool clearButtonVisible;

  const _CalendarHeader({
    Key? key,
    required this.focusedDay,
    required this.onLeftArrowTap,
    required this.onRightArrowTap,
    required this.onTodayButtonTap,
    required this.onClearButtonTap,
    required this.clearButtonVisible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final headerText = DateFormat.yMMM().format(focusedDay);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const SizedBox(width: 16.0),
          SizedBox(
            width: 120.0,
            child: Text(
              headerText,
              style: const TextStyle(fontSize: 26.0),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.calendar_today, size: 20.0),
            visualDensity: VisualDensity.compact,
            onPressed: onTodayButtonTap,
          ),
          if (clearButtonVisible)
            IconButton(
              icon: const Icon(Icons.clear, size: 20.0),
              visualDensity: VisualDensity.compact,
              onPressed: onClearButtonTap,
            ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: onLeftArrowTap,
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: onRightArrowTap,
          ),
        ],
      ),
    );
  }
} */

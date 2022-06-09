// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'dart:collection';
import 'package:covidapp/covidapp/calendar_view/widgets/daily_pie_peek.dart';
import 'package:table_calendar/table_calendar.dart';

/// Example event class.
class Event {
  /* final DayPiePeek daypiePeek; */
  final String title;
  /* final Color eventColor; */
  const Event(this.title);

  @override
  String toString() => title;
}

/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.

final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = {
  for (var item in List.generate(50, (index) => index))
    DateTime.utc(kFirstDay.year, kFirstDay.month, item + 1):
        List.generate(1, (index) => Event('Event $item | ${index + 1}'))
}..addAll({
    kToday: [],
  });
/* DayPiePeek daypiePeek = DayPiePeek(index);
final DayPiePeek dayPiePeek = DayPiePeek(index);
final _kEventSource = {
  DateTime.utc(kFirstDay.year, kFirstDay.month, kFirstDay.day): List.generate(
      1, (index) => Event(title)), */ /* 'Event $index' */

/* converted from: final _kEventSource = {  Map.fromIterable(List.generate(50, (index) => index),
    key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
    value: (item) => List.generate(
        item % 4 + 1, (index) => Event('Event $item | ${index + 1}')))} */

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month, kToday.day);
final kLastDay =
    DateTime(kToday.year, kToday.month, kToday.day + (31 - kToday.day));

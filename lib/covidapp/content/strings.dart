import 'package:covidapp/covidapp/content/calendar_content.dart';

/** Initializing of Variable Lists for Data Transfer*/

CalendarContent calContent = CalendarContent();
List healthscore = [
  {"name": "Krankheitsgrad", "amount": 30.0},
  {"name": "Härtefälle", "amount": 20.0},
  {"name": "Wohlbefinden", "amount": 70.0},
];
List hquestions = [
  {
    "qname": "Frage 1",
    "qcon": "Wie viel Wasser haben Sie heute getrunken?",
    "index": 1
  },
  {"qname": "Frage 2", "qcon": "Wie wohl fühlen Sie sich heute?", "index": 2},
];
List calenderChoices = [
  {
    "name": "Zustand",
    "emoji": "😍️\u200d",
    "item1": "Ausgezeichnet",
    "icon1": "😍️\u200d",
    "item2": "Gut",
    "icon2": "☺\u200d",
    "item3": "Neutral",
    "icon3": "😐️\u200d",
    "item4": "Schlecht",
    "icon4": "😧\u200d"
  },
  {
    "name": "Härtefälle",
    "emoji": "😍️\u200d",
    "item1": "Anzahl Härtefälle",
    "icon1": "#️⃣\u200d",
    "item2": "Dauer",
    "icon2": "⏱️\u200d",
    "item3": "Symptome",
    "icon3": "🧾\u200d",
    "item4": "Symptome",
    "icon4": "🧾\u200d"
  },
  {
    "name": "Krankheitsgrad",
    "emoji": "😍️\u200d",
    "item1": "Topfit",
    "icon1": "😍️\u200d",
    "item2": "milder Verlauf",
    "icon2": "☺\u200d",
    "item3": "spürbar krank",
    "icon3": "😧\u200d",
    "item4": "Symptome",
    "icon4": "🧾\u200d"
  },
  /*{"name": "Zustand", "emoji": "😍️\u200d",
    "item1":"Ausgezeichnet", "icon1": "😍️\u200d", "item2": "Gut", "icon1": "☺\u200d",  "item2": "Neutral", "icon3": "😐️\u200d",  "item4":"Schlecht", "icon4": "😧\u200d"},
  */
];

final List moodList = [
  {"name": "Ausgezeichnet", "icon1": "😍️\u200d", "amount": 1},
  {"name": "Gut", "icon2": "☺\u200d", "amount": 2},
  {"name": "Neutral", "icon3": "😐️\u200d", "amount": 3},
  {"name": "Schlecht", "icon4": "😧\u200d", "amount": 4},
];

final List andereSymptome = [
  {
    "tag": "Andere Symptome",
    "name": "Immunstörungen und Angststörungen, etc.",
    "desc": "Bitte beschreiben Sie diese",
    "value": calContent.comment,
  },
];
List headline = [
  {
    "tag": "Zustand",
    "name": "Gefühlszustand",
    "desc": "Der allgemeine Gefühlszustand",
    "value": calContent.mood,
    "valueString": calContent.mood.toString(),
    "color": calContent.getCalendarColors(1),
    "level": calContent.getLevel(calContent.mood),
  },
  {
    "tag": "Müdigkeit",
    "name": "Müdigkeit und Erschöpfung",
    "desc": "Geben Sie Ihren allgemeinen Zustand an",
    "value": calContent.muedigkeit,
    "valueString": calContent.muedigkeit.toString(),
    "color": calContent.getCalendarColors(2)
  },
  {
    "tag": "Atemnot",
    "name": "Kurzatmigkeit/Atemnot",
    "desc": "Wie oft verspüren Sie Kurzatmigkeit/Atemnot?",
    "value": calContent.atemnot,
    "valueString": calContent.atemnot.toString(),
    "color": calContent.getCalendarColors(3)
  },
  {
    "tag": "Sinne",
    "name": "Geschmacksverlust/Geruchsverlust",
    "desc": "Verspüren Sie Geruchs-/ und Geschmacksverlust?",
    "value": calContent.sinne,
    "valueString": calContent.sinne.toString(),
    "color": calContent.getCalendarColors(4)
  },
  {
    "tag": "Herz/Kreislauf",
    "name": "Herz-/Kreislaufprobleme",
    "desc": "Haben Sie Herz-/Kreislaufprobleme?",
    "value": calContent.herz,
    "valueString": calContent.herz.toString(),
    "color": calContent.getCalendarColors(5)
  },
  {
    "tag": "Schlaf",
    "name": "Schlafstörungen",
    "desc": "Geben Sie die Qualität Ihres Schlafes an",
    "value": calContent.schlaf,
    "valueString": calContent.schlaf.toString(),
    "color": calContent.getCalendarColors(6)
  },
  {
    "tag": "Nerven",
    "name": "Kopfschmerzen und Konzentrationsschwäche",
    "desc": "Wie oft haben Sie Kopfschmerzen/Konzentrationsschwächen?",
    "value": calContent.nerven,
    "valueString": calContent.nerven.toString(),
    "color": calContent.getCalendarColors(7)
  },
];

List weekContent = [
  {
    "Tag": calContent.dateL[0].toDouble(),
    "Zustand": calContent.moodL[0].toDouble(),
    'Muedigkeit': calContent.muedigkeitL[0].toDouble(),
    "Atemnot": calContent.atemnotL[0].toDouble(),
    "Sinne": calContent.sinneL[0].toDouble(),
    "Herz": calContent.herzL[0].toDouble(),
    "Schlaf": calContent.schlafL[0].toDouble(),
    "Nerven": calContent.nervenL[0].toDouble(),
  },
  {
    "Tag": calContent.dateL[1].toDouble(),
    "Zustand": calContent.moodL[1].toDouble(),
    'Muedigkeit': calContent.muedigkeitL[1].toDouble(),
    "Atemnot": calContent.atemnotL[1].toDouble(),
    "Sinne": calContent.sinneL[1].toDouble(),
    "Herz": calContent.herzL[1].toDouble(),
    "Schlaf": calContent.schlafL[1].toDouble(),
    "Nerven": calContent.nervenL[1].toDouble(),
  },
  {
    "Tag": calContent.dateL[2].toDouble(),
    "Zustand": calContent.moodL[2].toDouble(),
    'Muedigkeit': calContent.muedigkeitL[2].toDouble(),
    "Atemnot": calContent.atemnotL[2].toDouble(),
    "Sinne": calContent.sinneL[2].toDouble(),
    "Herz": calContent.herzL[2].toDouble(),
    "Schlaf": calContent.schlafL[2].toDouble(),
    "Nerven": calContent.nervenL[2].toDouble(),
  },
  {
    "Tag": calContent.dateL[3].toDouble(),
    "Zustand": calContent.moodL[3].toDouble(),
    'Muedigkeit': calContent.muedigkeitL[3].toDouble(),
    "Atemnot": calContent.atemnotL[3].toDouble(),
    "Sinne": calContent.sinneL[3].toDouble(),
    "Herz": calContent.herzL[3].toDouble(),
    "Schlaf": calContent.schlafL[3].toDouble(),
    "Nerven": calContent.nervenL[3].toDouble(),
  },
  {
    "Tag": calContent.dateL[4].toDouble(),
    "Zustand": calContent.moodL[4].toDouble(),
    'Muedigkeit': calContent.muedigkeitL[4].toDouble(),
    "Atemnot": calContent.atemnotL[4].toDouble(),
    "Sinne": calContent.sinneL[4].toDouble(),
    "Herz": calContent.herzL[4].toDouble(),
    "Schlaf": calContent.schlafL[4].toDouble(),
    "Nerven": calContent.nervenL[4].toDouble(),
  },
  {
    "Tag": calContent.dateL[5].toDouble(),
    "Zustand": calContent.moodL[5].toDouble(),
    'Muedigkeit': calContent.muedigkeitL[5].toDouble(),
    "Atemnot": calContent.atemnotL[5].toDouble(),
    "Sinne": calContent.sinneL[5].toDouble(),
    "Herz": calContent.herzL[5].toDouble(),
    "Schlaf": calContent.schlafL[5].toDouble(),
    "Nerven": calContent.nervenL[5].toDouble(),
  },
];

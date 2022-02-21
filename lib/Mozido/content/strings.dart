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
  // {"qname": "Frage 3", "qcon":"Wie viele gesundheitliche Beschwerden hatten Sie heute im Laufe des Tages?", "index": 3},
  // {"qname": "Frage 4", "qcon":"Welche dieser Beschwerden können Sieden folgenden Symptomen zuordnen \n Fieber, Husten, Atemnot, Kopfmscherzen, Müdigkeit, Antriebslosigkeit?", "amount": 4},
//  {"qname": "Frage 5", "qcon":"Wie schätzen Sie Ihre heutige Leistung ein?", "index": 5},
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
  //"item4":"Schlecht", "icon4": "😧\u200d"},
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

final List headline = [
  {"tag": "Zustand", "name": "Gefühlszustand"},
  {
    "tag": "Müdigkeit",
    "name": "Müdigkeit und Erschöpfung",
    "desc": "Geben Sie Ihren allgemeinen Zustand an",
    "min": 1,
    "max": 10
  },
  {
    "tag": "Atemnot",
    "name": "Kurzatmigkeit/Atemnot",
    "desc": "Wie oft verspüren Sie Kurzatmigkeit/Atemnot?"
  },
  {
    "tag": "Sinne",
    "name": "Geschmacksverlust/Geruchsverlust",
    "desc": "Verspüren Sie Geruchs-/ und Geschmacksverlust?"
  },
  {
    "tag": "Herz/Kreislauf",
    "name": "Herz-/Kreislaufprobleme",
    "desc": "Haben Sie Herz-/Kreislaufprobleme?"
  },
  {
    "tag": "Schlaf",
    "name": "Schlafstörungen",
    "desc": "Geben Sie die Qualität Ihres Schlafes an",
    "min": 1,
    "max": 10
  },
  {
    "tag": "Nerven",
    "name": "Kopfschmerzen und Konzentrationsschwäche",
    "desc": "Wie oft haben Sie Kopfschmerzen/Konzentrationsschwächen?"
  },
  {
    "tag": "Andere Symptome",
    "name": "Immunstörungen und Angststörungen, etc.",
    "desc": "Bitte beschreiben Sie diese"
  },
];

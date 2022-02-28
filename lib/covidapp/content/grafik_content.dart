import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';

/** Initializing Variables */
class GrafikContent {
  final String mood;
  final String muedigkeit;
  final String atemnot;
  final String sinne;
  final String herz;
  final String schlaf;
  final String nerven;
  final String comment;
  final String createdDate;
  GrafikContent(this.mood, this.muedigkeit, this.atemnot, this.sinne, this.herz,
      this.schlaf, this.nerven, this.comment, this.createdDate);

  GrafikContent.fromData(Map<String, dynamic> data)
      : mood = data['mood'],
        muedigkeit = data['muedgkeit'],
        atemnot = data['atemnot'],
        sinne = data['sinne'],
        herz = data['herz'],
        schlaf = data['schlaf'],
        nerven = data['nerven'],
        comment = data['comment'],
        createdDate = data['create_date'];

  GrafikContent.fromMap(Map<String, dynamic> map)
      : assert(map['mood'] != null),
        assert(map['muedigkeit'] != null),
        assert(map['atemnot'] != null),
        assert(map['sinne'] != null),
        assert(map['herz'] != null),
        assert(map['schlaf'] != null),
        assert(map['nerven'] != null),
        assert(map['comment'] != null),
        assert(map['create_date'] != null),
        mood = map['mood'],
        muedigkeit = map['muedigkeit'],
        atemnot = map['atemnot'],
        sinne = map['sinne'],
        herz = map['herz'],
        schlaf = map['schlaf'],
        nerven = map['nerven'],
        comment = map['comment'],
        createdDate = map['create_date'];

  @override
  String toString() =>
      "Record<$mood:$muedigkeit:$atemnot:$sinne:$herz:$schlaf:$nerven:$comment:$createdDate>";
}

class GrafikColors {
  Color colorlow = Colors.white30 as Color;
}

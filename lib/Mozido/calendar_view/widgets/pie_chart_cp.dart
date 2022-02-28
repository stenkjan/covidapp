import 'dart:math';
import 'package:covidapp/Mozido/content/calendar_content.dart';
import 'package:covidapp/Mozido/content/strings.dart';
import 'package:covidapp/Mozido/models/grafik_models.dart';
import 'package:flutter/material.dart';

class PieChartCustomPainter extends CustomPainter {
  final List healthscore;
  late final GrafikModel graphMod;
  late final CalendarContent calContent;
  final double width;
  /* List <GrafikContent> docList;
    GrafikModel grafModel; */
  PieChartCustomPainter({required this.healthscore, required this.width});

  @override
  void paint(Canvas canvas, Size size) {
    graphMod = GrafikModel(healthscore);
    calContent = CalendarContent();
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    double total = calContent.listSum();
    double startRadian = -pi / 2;

    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = width / 1.8;
    headline.forEach((f) => total += f['value']);
    for (var i = 0; i < headline.length - 1; i++) {
      //var listDouble = healthscore.map((i) => i.toDouble()).toList();
      final currentCategory = headline[i];
      final sweepRadian = (currentCategory['value'] / total) * 2 * pi;
      paint.color = headline[i]['color'];
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
          startRadian, sweepRadian, false, paint);
      startRadian += sweepRadian;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

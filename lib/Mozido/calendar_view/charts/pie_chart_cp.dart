import 'dart:math';
import 'package:flutter/material.dart';
import 'package:covidapp/Mozido/calendar_view/charts/colors.dart';




class PieChartCustomPainter extends CustomPainter {
  final List healthscore;
  final double width;
  PieChartCustomPainter({required this.healthscore, required this.width});
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    double total = 0;
    double startRadian = -pi / 2;
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = width / 1.8;
    healthscore.forEach((f) => total += f['amount']);
    for (var i = 0; i < healthscore.length; i++) {
      final currentCategory = healthscore[i];
      final sweepRadian = (currentCategory['amount'] / total ) * 2  * pi;
      paint.color = AppColors.pieColors[i];
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
          startRadian, sweepRadian, false, paint);
      startRadian += sweepRadian;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
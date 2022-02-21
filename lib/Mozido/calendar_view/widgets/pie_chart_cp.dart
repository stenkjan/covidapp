import 'dart:math';
import 'package:covidapp/Mozido/models/grafik_models.dart';
import 'package:flutter/material.dart';
import 'package:covidapp/Mozido/calendar_view/widgets/colors.dart';

class PieChartCustomPainter extends CustomPainter {
  final List healthscore;
  late final GrafikModel graphMod;
  final double width;
   /* List <GrafikContent> docList;
    GrafikModel grafModel; */
  PieChartCustomPainter({required this.healthscore, required this.width});
 
  @override
  void paint(Canvas canvas, Size size) {
     graphMod = GrafikModel(healthscore);
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    double total = 0;
    double startRadian = -pi / 2;
    
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = width / 1.8;
      
      total == graphMod.listSum();
    
    for (var i = 0; i < healthscore.length; i++) {
      final currentCategory = healthscore[i];
      final sweepRadian = (currentCategory[i] / total) * 2 * pi;
      paint.color = AppColors.pieColors[i];
      canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
          startRadian, sweepRadian, false, paint);
      startRadian += sweepRadian;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

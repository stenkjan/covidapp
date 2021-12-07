import 'package:covidapp/Mozido/content/size.dart';
import 'package:covidapp/Mozido/content/strings.dart';
import 'package:flutter/material.dart';
import 'package:covidapp/Mozido/calendar_view/charts/pie_chart_cp.dart';


import 'package:covidapp/Mozido/calendar_view/charts/colors.dart';


  class PieChart extends StatefulWidget {
    PieChart({Key? key}) : super(key: key);
  _PieChartState createState() => _PieChartState();
  }

  class _PieChartState extends State<PieChart>
  with SingleTickerProviderStateMixin {
    double total = 0;

    @override
    void initState() {
      super.initState();
      healthscore.forEach((e) => total += e['amount']);
    }

    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      var width = SizeConfig.getWidth(context);
      double fontSize(double size) {
        return size * width / 414;
      }

      return LayoutBuilder(

        builder: (context, constraint) {
          return Container(
            decoration: BoxDecoration(
                color: AppColors.primaryWhite,
                shape: BoxShape.circle,
                boxShadow: AppColors.neumorpShadow),
            child: Stack(
              children: <Widget>[
                Center(
                  child: SizedBox(
                    width: constraint.maxWidth * 0.6,
                    child: CustomPaint(
                      child: Container(),
                      foregroundPainter: PieChartCustomPainter(
                        width: constraint.maxWidth * 0.5,
                        healthscore:  healthscore),

                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: constraint.maxWidth * .5,
                    decoration: BoxDecoration(
                        color: AppColors.primaryWhite,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(3, 3),
                              color: Colors.black38)
                        ]),
                    child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 0, left: 72),
                          child: Text(

                            (total/5).toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: fontSize(20),

                                 shadows: [
                                 Shadow(
                                  offset: Offset(2.0, 2.0),
                                  blurRadius: 20.0,
                                  color: Color.fromRGBO(220,255,255, 30.0),



                                ),
                    ],
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ),
/*
                            Padding(
                              padding: const EdgeInsets.only(left:8.0),
                              child: Text(
                               "/100",
                          style: TextStyle(
                                 fontSize: fontSize(30),
                                fontWeight: FontWeight.w500,
                              shadows: [
                                Shadow(
                                  offset: Offset(1.0, 1.0),
                                  blurRadius: 2.0,
                                  color: Color.fromRGBO(55, 71, 79, 50.0),



                                ),
                              ],
                         ),
                              ),
                            ),*/
                      ],
                    ),
                  ),
                ),
          ),
                ),
          ],
          ),
                );


        },
      );
    }
  }

    /*
    return Padding(
    padding: const EdgeInsets.only(right: 12.0),

    child: Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: customShadow, color: primaryColor),
   child: Stack(
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(16.0),
      child: CustomPaint(
        child: Container(),
        foregroundPainter: PieChartPainter(),
    ),
      ),
   Center(
     child: Container(
      height: 70,
      width: 70,
      child: Center(child: Text('100',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),),
      decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: customShadow, color: primaryColor),
    
     ),
   ),
    ],
    ),
    ),);
  }
}
class PieChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    var paint = Paint()..style = PaintingStyle.stroke..strokeWidth = 50;
    double total = 0;
    healthscore.forEach((element) {
      total += element['amount'];
    });

    for (int i=0;i<healthscore.length;i++){
      var startRadian = -pi/2;
      var current_healthscore = healthscore[i];
      var sweepRadian = (current_healthscore['amount']/total)*2*pi;
      paint.color= AppColors.pieColors[i];
      canvas.drawArc(Rect.fromCircle(center: center,radius: radius), startRadian, sweepRadian, false, paint);
      startRadian+= sweepRadian;
    }

  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
   return true;

   */


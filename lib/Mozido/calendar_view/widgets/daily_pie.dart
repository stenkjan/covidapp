import 'package:covidapp/Mozido/calendar_view/widgets/colors.dart';
import 'package:covidapp/Mozido/content/calendar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../content/strings.dart';

class DayPie extends StatefulWidget {
  DayPie({Key? key}) : super(key: key);

  @override
  _DayPieState createState() => _DayPieState();
}

class _DayPieState extends State<DayPie> {
  late CalendarContent calContent;
  late Map<String, double> dataMap;
  @override
  void initState() {
    calContent = CalendarContent();
    dataMap = {
      headline[1]['tag']: calContent.muedigkeit.toDouble(),
      headline[2]['tag']: calContent.atemnot.toDouble(),
      headline[3]['tag']: calContent.sinne.toDouble(),
      headline[4]['tag']: calContent.herz.toDouble(),
      headline[5]['tag']: calContent.schlaf.toDouble(),
      headline[6]['tag']: calContent.nerven.toDouble(),
    };

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PieChart(
      dataMap: dataMap,
      animationDuration: const Duration(milliseconds: 800),
      chartLegendSpacing: 30,
      chartRadius: MediaQuery.of(context).size.width / 3.2,
      colorList: AppColors.pieColors.cast(),
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      ringStrokeWidth: 52,
      centerText: "Symptome",
      legendOptions: const LegendOptions(
        showLegendsInRow: true,
        legendPosition: LegendPosition.top,
        showLegends: true,
        legendShape: BoxShape.circle,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
      ),

      chartValuesOptions: const ChartValuesOptions(
        showChartValueBackground: true,
        showChartValues: true,
        showChartValuesInPercentage: true,
        showChartValuesOutside: false,
        decimalPlaces: 1,
      ),
      // gradientList: ---To add gradient colors---
      // emptyColorGradient: ---Empty Color gradient---
    );
  }
}
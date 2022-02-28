import 'package:covidapp/covidapp/calendar_view/widgets/colors.dart';
import 'package:covidapp/covidapp/content/calendar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

import '../../content/strings.dart';

class DayPie extends StatefulWidget {
  const DayPie({Key? key}) : super(key: key);

  @override
  _DayPieState createState() => _DayPieState();
}

class _DayPieState extends State<DayPie> {
  late CalendarContent calContent;
  @override
  void initState() {
    calContent = CalendarContent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CalendarContent calContent = Provider.of<CalendarContent>(context);
    return PieChart(
      dataMap: calContent.daypiedataMap(),
      animationDuration: const Duration(milliseconds: 800),
      chartLegendSpacing: 18,
      chartRadius: MediaQuery.of(context).size.width / 2.3,
      colorList: AppColors.pieColors.cast(),
      initialAngleInDegree: 50,
      chartType: ChartType.ring,
      ringStrokeWidth: 35,
      centerText: "Symptome",
      legendOptions: LegendOptions(
        showLegendsInRow: true,
        legendPosition: LegendPosition.bottom,
        showLegends: calContent.pieLegendbool,
        legendShape: BoxShape.circle,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.primaryWhite,
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

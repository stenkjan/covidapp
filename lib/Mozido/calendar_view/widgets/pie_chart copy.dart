/* import 'package:covidapp/Mozido/calendar_view/widgets/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../content/strings.dart';

class PieChartNew extends StatefulWidget {
  final Map<String, double> dataMap;
  PieChartNew(this.dataMap);

  @override
  _PieChartNewState createState() => _PieChartNewState();
}

class _PieChartNewState extends State<PieChartNew> {
  @override
  Widget build(BuildContext context) {
    return PieChart(
      dataMap: widget.dataMap,
      animationDuration: const Duration(milliseconds: 800),
      chartLegendSpacing: 32,
      chartRadius: MediaQuery.of(context).size.width / 3.2,
      colorList: AppColors.pieColors.cast(),
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      ringStrokeWidth: 32,
      centerText: "HYBRID",
      legendOptions: const LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.right,
        showLegends: true,
        legendShape: BoxShape.circle,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: const ChartValuesOptions(
        showChartValueBackground: true,
        showChartValues: true,
        showChartValuesInPercentage: false,
        showChartValuesOutside: false,
        decimalPlaces: 1,
      ),
      // gradientList: ---To add gradient colors---
      // emptyColorGradient: ---Empty Color gradient---
    );
  }
}
 */
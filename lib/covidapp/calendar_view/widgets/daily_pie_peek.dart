import 'package:covidapp/covidapp/calendar_view/widgets/colors.dart';
import 'package:covidapp/covidapp/content/calendar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

class DayPiePeek extends StatefulWidget {
  final int index;
  const DayPiePeek( this.index, {Key? key}) : super(key: key);
  @override
  _DayPiePeekState createState() => _DayPiePeekState();
}

class _DayPiePeekState extends State<DayPiePeek> {
  late CalendarContent calContent;
  
  @override
  void initState() {
    calContent = CalendarContent();
    super.initState();
  }
 @override
  dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    CalendarContent calContent = Provider.of<CalendarContent>(context);
    
    return Column(
      children: [
        PieChart(
          dataMap: calContent.daypiedataMapCalendar(widget.index),
          animationDuration: const Duration(milliseconds: 800),
          chartLegendSpacing: 18,
          chartRadius: MediaQuery.of(context).size.width / 20.3,
          colorList: AppColors.pieColors.cast(),
          initialAngleInDegree: 50,
          chartType: ChartType.ring,
          ringStrokeWidth: 55,
          centerText: "",
          legendOptions: const LegendOptions(
            showLegends: false,
          ),
          chartValuesOptions: const ChartValuesOptions(
            showChartValueBackground: true,
            showChartValues: false,
            showChartValuesInPercentage: false,
            showChartValuesOutside: false,
            decimalPlaces: 1,
          ),
          // gradientList: ---To add gradient colors---
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

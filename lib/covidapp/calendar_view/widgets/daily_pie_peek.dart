import 'package:covidapp/covidapp/calendar_view/widgets/colors.dart';
import 'package:covidapp/covidapp/content/calendar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

class DayPiePeek extends StatefulWidget {
  final int index;
  final Color color;
  const DayPiePeek(this.index, this.color, {Key? key}) : super(key: key);
  @override
  DayPiePeekState createState() => DayPiePeekState();
}

class DayPiePeekState extends State<DayPiePeek> {
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
    Color color = widget.color;
    return Row(
      children: [
        /*  TextButton.icon(
          label: const Text(
            "Summe",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.black54,
            ),
          ),
          icon: Icon(
            Icons.pie_chart,
            size: 50,
            color: color,
          ),
          onPressed: () {},
        ),
        const SizedBox(width: 20), */
        PieChart(
          dataMap: calContent.daypiedataMapCalendar(widget.index),
          animationDuration: const Duration(milliseconds: 800),
          chartLegendSpacing: 18,
          chartRadius: MediaQuery.of(context).size.width / 10.3,
          colorList: AppColors.pieColors.cast(),
          initialAngleInDegree: 50,
          chartType: ChartType.ring,
          ringStrokeWidth: 55,
          centerText: "",
          legendOptions: const LegendOptions(
            showLegends: false,
          ),
          chartValuesOptions: const ChartValuesOptions(
            showChartValueBackground: false,
            showChartValues: true,
            showChartValuesInPercentage: true,
            showChartValuesOutside: true,
            decimalPlaces: 1,
          ),
          // gradientList: ---To add gradient colors---
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

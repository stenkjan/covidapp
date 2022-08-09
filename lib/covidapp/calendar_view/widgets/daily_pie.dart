import 'package:covidapp/covidapp/calendar_view/widgets/colors.dart';
import 'package:covidapp/covidapp/content/calendar_content.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

class DayPie extends StatefulWidget {
  const DayPie({Key? key}) : super(key: key);

  @override
  DayPieState createState() => DayPieState();
}

class DayPieState extends State<DayPie> {

 
  @override
  void initState() {
 
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CalendarContent calContent = Provider.of<CalendarContent>(context);
    /* final grafService = Provider.of<GrafikService>(context); */
   /*  final CollectionReference calCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(grafService.uid)
        .collection('calendar'); */
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Stack(
          children: [
            Container(
              alignment: Alignment.topRight,
              child: TextButton(
                  onPressed: () => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                              backgroundColor: Colors.black12,
                              title: const Text(""),
                              content: const Text(
                                  "Die Grafik gibt an, welche Symptome für den ausgewählten Tag zu welchem Anteil das Krankheitsbild prägen.",
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                              actions: [
                                TextButton(
                                  child: const Text("Verstanden"),
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ])),
                  child: const Icon(
                    Icons.info,
                    color: Colors.white,
                  )),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: PieChart(
                dataMap: calContent.getpieMap(),
                animationDuration: const Duration(milliseconds: 800),
                chartLegendSpacing: 25,
                chartRadius: MediaQuery.of(context).size.width / 2.8,
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
                  showChartValuesOutside: true,
                  decimalPlaces: 1,
                ),
                // gradientList: ---To add gradient colors---
              ),
            ),
          ],
        ),
      ],
    );
  }
}

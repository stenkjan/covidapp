import 'package:covidapp/covidapp/calendar_view/widgets/colors.dart';
import 'package:covidapp/covidapp/content/calendar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
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
    int index = widget.index;
    return Padding(
      padding: const EdgeInsets.only(
        left: 2.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
            ),
            child: Neumorphic(
              style: NeumorphicStyle(
                  shape: NeumorphicShape.concave,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
                  depth: 3,
                  intensity: 2.0,
                  shadowLightColor: Colors.transparent,
                  /*  lightSource: LightSource.topLeft, */
                  color: const Color(0xFF31A1C9)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        children: [
                          const Icon(
                            Icons.air,
                            color: Colors.grey,
                            size: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, top: 12),
                            child: SizedBox(
                              height: 2,
                              width: 2,
                              child: Icon((() {
                                setState(() {
                                  if (calContent.breatheTrue == true) {
                                    calContent.getbreatheTrueWeek(index);
                                  }
                                });
                              })()),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 5),
                      Stack(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Icon(
                              Icons.favorite,
                              color: Colors.grey,
                              size: 25,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 12),
                            child: SizedBox(
                              height: 2,
                              width: 2,
                              child: Icon((() {
                                setState(() {
                                  if (calContent.pulseTrue == true) {
                                    calContent.getpulseTrueWeek(index);
                                  }
                                });
                              })()),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 5),
                      Stack(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Icon(
                              Icons.emoji_emotions,
                              color: Colors.grey,
                              size: 25,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 12),
                            child: SizedBox(
                              height: 2,
                              width: 2,
                              child: Icon((() {
                                setState(() {
                                  if (calContent.calTrue == true || calContent.spoofCheck == false) {
                                    calContent.getcalendarTrueWeek(index);
                                  }
                                });
                              })()),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 5,
                    ),
                    child: Center(
                      child: Text(
                        "Übungsfortschritt",
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Icon(
                          Icons.pie_chart,
                          size: 25,
                          color: color,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 4.0,
                          top: 4,
                        ),
                        child: Column(
                          children: [
                            Text(
                              "${calContent.sumColorList[index].round()} ",
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                color: Colors.black54,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 4, right: 8.0),
                              child: Text(
                                "Tagessumme",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          /*    const SizedBox(width: 2),
          const Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Divider(
              color: Colors.grey,
              thickness: 2.0,
              indent: 12.0,
              endIndent: 12.0,
            ),
          ),
          const SizedBox(width: 2), */
          Neumorphic(
            padding: const EdgeInsets.all(25),
            style: const NeumorphicStyle(
                shape: NeumorphicShape.convex,
                boxShape: NeumorphicBoxShape.circle(),
                depth: 3,
                intensity: 2.0,
                shadowLightColor: Colors.transparent,
                /*  lightSource: LightSource.topLeft, */
                color: Color(0xFF31A1C9)),
            drawSurfaceAboveChild: true,
            child: PieChart(
              dataMap: calContent.daypiedataMapCalendar(widget.index),
              animationDuration: const Duration(milliseconds: 800),

              chartRadius: MediaQuery.of(context).size.width / 20.3,
              colorList: AppColors.pieColors.cast(),
              initialAngleInDegree: 0,
              chartType: ChartType.ring,
              ringStrokeWidth: 120,
              centerText: "",
              legendOptions: const LegendOptions(
                showLegends: false,
              ),
              chartValuesOptions: ChartValuesOptions(
                showChartValueBackground: true,
                chartValueBackgroundColor:
                    const Color.fromARGB(83, 158, 158, 158),
                showChartValues: true,
                showChartValuesInPercentage: true,
                showChartValuesOutside: true,
                chartValueStyle: defaultChartValueStyle.copyWith(
                  color: Colors.black,
                  fontSize: 14,
                ),
                decimalPlaces: 0,
              ),
              // gradientList: ---To add gradient colors---
            ),
          ),
        ],
      ),
    );
  }
}

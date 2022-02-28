import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'heart_bpm.dart';

export 'package:covidapp/Mozido/Puls_Messung/heart_bpm.dart' show BPMChart;

/// Generate a simple heart BPM graph
class BPMChart extends StatelessWidget {
  /// Data series formatted to be plotted
  final List<charts.Series<SensorValue, DateTime>> _data;

  /// Generate the heart BPM graph from given list of [data] of type
  /// [SensorValue]
  BPMChart(
    /// List of Sensor Value data points to be plotted
    List<SensorValue> data, {Key? key, 

    /// List of second series of Sensor Value data points to be plotted
    List<SensorValue>? data2,
  }) : _data = data2 == null
            ? [_updateChartData(data)]
            : [_updateChartData(data), _updateChartData(data2, 2)], super(key: key);

  /// Function to convert as list of [SensorValue] to [Series] ready for
  /// plotting
  static charts.Series<SensorValue, DateTime> _updateChartData(
      List<SensorValue> data,
      [int seriesNumber = 1]) {
    return charts.Series<SensorValue, DateTime>(
      id: "BPM",
      colorFn: (datum, index) => seriesNumber == 1
          ? charts.MaterialPalette.blue.shadeDefault
          : charts.MaterialPalette.green.shadeDefault,
      domainFn: (datum, index) => datum.time,
      measureFn: (datum, index) => datum.value,
      data: data,
    );
  }

  @override
  Widget build(BuildContext context) {
    num min = _data[0]
            .data
            .reduce((value, element) =>
                (value.value < element.value) ? value : element)
            .value,
        max = _data[0]
            .data
            .reduce((value, element) =>
                (value.value > element.value) ? value : element)
            .value;

    return charts.TimeSeriesChart(
      _data,
      primaryMeasureAxis: charts.NumericAxisSpec(
        showAxisLine: false,
        renderSpec: charts.NoneRenderSpec(),
        viewport: charts.NumericExtents(min, max),
        tickProviderSpec:
            charts.StaticNumericTickProviderSpec(<charts.TickSpec<num>>[
          charts.TickSpec<num>(min),
          charts.TickSpec<num>(max),
        ]),
      ),
      domainAxis: charts.DateTimeAxisSpec(
        renderSpec: charts.NoneRenderSpec(),
        showAxisLine: false,
      ),
      dateTimeFactory: const charts.LocalDateTimeFactory(),
    );
  }
}

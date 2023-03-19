import 'package:reckon_farmyaar/screens/homescreen/forecast_home.dart';

// import '/provider/graph_func.dart' show Data;
import 'package:flutter/material.dart';
import 'package:reckon_farmyaar/utils/utils.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Graph extends StatelessWidget {
  final List<CastData> data;
  final String title;
  const Graph({super.key, required this.data, required this.title});

  @override
  Widget build(BuildContext context) {
    List<String> strip = title.split(' ');
    return SizedBox(
      height: h(context) * 0.3,
      width: w(context) * 0.5,
      child: SfCartesianChart(
        backgroundColor: Colors.white,
        primaryXAxis: CategoryAxis(
          title: AxisTitle(text: strip[2]),
          edgeLabelPlacement: EdgeLabelPlacement.shift,
        ),
        primaryYAxis: NumericAxis(
          title: AxisTitle(text: strip[0],),
        ),
        title: ChartTitle(text: title),
        legend: Legend(isVisible: true, position: LegendPosition.bottom),
        // Enable tooltip
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <ChartSeries>[
          LineSeries<CastData, String>(
              name: title,
              dataSource: data,
              xValueMapper: (CastData d, _) => d.time,
              yValueMapper: (CastData d, _) => d.parameter,
              color: Color(0xffE2585D),
              // Enable data label
              dataLabelSettings: const DataLabelSettings(isVisible: true)),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:reckon_farmyaar/utils/utils.dart';
import 'package:reckon_farmyaar/widgets/graph.dart';

class ForecastHome extends StatefulWidget {
  const ForecastHome({super.key});

  @override
  State<ForecastHome> createState() => _ForecastHomeState();
}

class _ForecastHomeState extends State<ForecastHome> {
  List<CastData> hrtemp = [];

  @override
  void didChangeDependencies() {
    print('f');
    // await data(context, false).getforecast();
    var tempT = data(context, false).dailyTime();
    var tempP = data(context, false).dailyTemp();
    for (int i = 0; i < tempT.length; i++) {
      hrtemp.add(CastData(time: tempT[i], parameter: tempP[i]));
    }
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Graph(data: hrtemp, title: 'Temperature vs Time');
  }
}

class CastData {
  final String time;
  final double parameter;

  CastData({required this.time, required this.parameter});
}

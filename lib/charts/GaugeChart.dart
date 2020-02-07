

import 'package:ast_apps/models/AllProgress.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class GaugeCharts extends StatelessWidget{
  final AllProgress allProgress;

  GaugeCharts(this.allProgress);

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 70,
      lineWidth: 8,
      percent: (allProgress.minValue/allProgress.maxValue),
      center: Text("${allProgress.minValue}/${allProgress.maxValue}"),
      progressColor: Color.fromRGBO(143, 148, 251, 1),
      backgroundColor: Colors.grey,
    );
  }
}



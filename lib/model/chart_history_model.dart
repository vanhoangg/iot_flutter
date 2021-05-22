import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class ChartHistorySenSor {
  String topic;
  int countEnable;
  charts.Color color;

  ChartHistorySenSor({this.topic, this.countEnable = 0, Color color})
      : this.color = charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}

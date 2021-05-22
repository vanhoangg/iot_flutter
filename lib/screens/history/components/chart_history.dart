import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iot_flutter/model/chart_history_model.dart';
import 'package:iot_flutter/screens/history/history_controller.dart';

class HistoryChartPage extends StatefulWidget {
  final List<ChartHistorySenSor> data;

  const HistoryChartPage({Key key, this.data}) : super(key: key);
  @override
  _HistoryChartPageState createState() => _HistoryChartPageState();
}

class _HistoryChartPageState extends State<HistoryChartPage> {
  var series;

  @override
  void initState() {
    setState(() {
      series = [
        new charts.Series(
          id: 'Clicks',
          domainFn: (ChartHistorySenSor clickData, _) => clickData.topic,
          measureFn: (ChartHistorySenSor clickData, _) => clickData.countEnable,
          colorFn: (ChartHistorySenSor clickData, _) => clickData.color,
          data: this.widget.data,
        ),
      ];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      series,
      animate: true,
    );
  }
}
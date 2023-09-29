import 'package:flutter/material.dart';
import 'package:reminder/model/data_model.dart';
import 'package:reminder/screen/chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartScreenToday extends StatefulWidget {
  const ChartScreenToday({super.key});

  @override
  State<ChartScreenToday> createState() => _ChartScreenTodayState();
}

class _ChartScreenTodayState extends State<ChartScreenToday> {
  late List<ChartData> _chartdatas;     
  late TooltipBehavior _tooltipBehavior;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Container(),

      
    );
  }

  List<ChartData> getChartData() {
    final List<ChartData> chartdatas = [
      ChartData('Birthday', 3500),
      ChartData('Wedding', 1000),
      ChartData('House Warming', 2000),
      ChartData('Engagement', 2000),
      ChartData('Inaguration', 1000),
    ];
    return chartdatas;
  }
}

class ChartData {
  ChartData(this.continent, this.gd);
  final String continent;
  final int gd;
}

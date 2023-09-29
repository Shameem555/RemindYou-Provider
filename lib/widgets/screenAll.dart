import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';



class ChartScreenAll extends StatelessWidget {
  ChartScreenAll({super.key});

  final List<ChartData> chartData = [
    ChartData('Birthday', 3500),
    ChartData('Wedding', 1000),
    ChartData('House Warming', 2000),
    ChartData('Engagement', 2000),
    ChartData('Inauguration', 1000),
  ];


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SfCircularChart(
        legend: const Legend(
          isVisible: true,
          overflowMode: LegendItemOverflowMode.wrap),
        series: <CircularSeries>[
          // Render pie chart
          PieSeries<ChartData, String>(
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.category,
            yValueMapper: (ChartData data, _) => data.value,
            dataLabelSettings: const DataLabelSettings(isVisible: true),
            enableTooltip: true,
          ),
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.category, this.value);
  final String category;
  final int value;
}
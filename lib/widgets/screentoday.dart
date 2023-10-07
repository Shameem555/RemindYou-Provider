import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class ChartScreenToday extends StatelessWidget {
  ChartScreenToday({super.key});

final List<ChartData> chartData = [
    ChartData('Birthday', 1),
    ChartData('Wedding', 1),
    ChartData('House Warming', 1),
    ChartData('Engagement', 1),
    ChartData('Inauguration', 1),
  ];


  @override
  Widget build(BuildContext context) {
    // Add your chart data for "Today" here
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
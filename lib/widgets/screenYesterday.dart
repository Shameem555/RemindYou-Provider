import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartScreenYesterday extends StatelessWidget {
   ChartScreenYesterday({super.key});

   final List<ChartData> chartData = [
    ChartData('Birthday', 3),
    ChartData('Wedding', 2),
    ChartData('House Warming', 0),
    ChartData('Engagement', 2),
    ChartData('Inauguration', 4),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SfCircularChart(
        legend: const Legend(
          isVisible: true,
          overflowMode: LegendItemOverflowMode.wrap),
          series: <CircularSeries>[
            PieSeries<ChartData,String>(
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.category,
              yValueMapper: (ChartData data, _) => data.value,
              dataLabelSettings: const DataLabelSettings(isVisible: true),
              enableTooltip: true,
            )
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
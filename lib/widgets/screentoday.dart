import 'package:flutter/material.dart';
import 'package:reminder/widgets/utility.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


// ignore: must_be_immutable
class ChartScreenToday extends StatelessWidget {
  ChartScreenToday({super.key});
  todayscreenchart tdyval = todayscreenchart();

final List<ChartData> chartData = [
    ChartData('Birthday', birthdays.length.toInt()),
    ChartData('Wedding', weddings.length.toInt()),
    ChartData('Engagement', engagements.length.toInt()),
    ChartData('House Warming', houseWarmings.length.toInt()),
    ChartData('Anniversary', anniversarys.length.toInt()),
    ChartData('Others', otherss.length.toInt()),
  ];


  @override
  Widget build(BuildContext context) {
    //chart data for = Today
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
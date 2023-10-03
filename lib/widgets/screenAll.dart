import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:reminder/model/data_model.dart';
import 'package:reminder/widgets/utility.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


final box = Hive.box<EventModel>('data');
var chartHistory = box.values.toList();

Map<String, int> birthdayCounts = count(chartHistory, 'birthday');
Map<String, int> weddingCounts = count(chartHistory, 'wedding');
Map<String, int> engagementCounts = count(chartHistory, 'engagement');
Map<String, int> houseWarmingCounts = count(chartHistory, 'houseWarming');
Map<String, int> anniversaryCounts = count(chartHistory, 'anniversary');
Map<String, int> othersCounts = count(chartHistory, 'others');

class ChartScreenAll extends StatelessWidget {
  ChartScreenAll({super.key});

  final List<ChartData> chartData = [
    ChartData('Birthday', 3000),
    ChartData('Wedding', 1000),
    ChartData('Engagement', 2000),
    ChartData('House Warming', 2000),
    ChartData('Anniversary', 1000),
    ChartData('Others', 1000),
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
  final String category ;
  final int value;
}

List<ChartData> updateChartData(List<EventModel> history, List<String> categories) {
  List<ChartData> updatedData = [];

  for (String category in categories) {
    int count = history.where((event) => event.catogory == category).length;
    updatedData.add(ChartData(category, count));
  }

  return updatedData;
}

import 'package:flutter/material.dart';
import 'package:reminder/model/data_model.dart';
// import 'package:hive_flutter/hive_flutter.dart';
//import 'package:reminder/model/data_model.dart';
import 'package:reminder/widgets/utility.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


// final box = Hive.box<EventModel>('data');
// var chartHistory = box.values.toList();

// Map<String, int> birthdayCounts = count(chartHistory, 'birthday');
// Map<String, int> weddingCounts = count(chartHistory, 'wedding');
// Map<String, int> engagementCounts = count(chartHistory, 'engagement');
// Map<String, int> houseWarmingCounts = count(chartHistory, 'houseWarming');
// Map<String, int> anniversaryCounts = count(chartHistory, 'anniversary');
// Map<String, int> othersCounts = count(chartHistory, 'others');

class ChartScreenAll extends StatelessWidget {
  ChartScreenAll({super.key,required this.chartHistory});

List<dynamic>chartHistory;
// int b;
// int w;
// int e;
// int h;
// int a;
// int o;

  final List<ChartData> chartData = [
    // allList(name: 'birthday', alldatalist: []),
    // allList(name: 'wedding', alldatalist: []),
    // allList(name: 'engagement', alldatalist: []),
    // allList(name: 'anniversary', alldatalist: []),
    // allList(name: 'houseWarming', alldatalist: []),
    // allList(name: 'others', alldatalist: []),
    ChartData('Birthday', birthday.length.toInt()),
    ChartData('Wedding', wedding.length.toInt()),
    ChartData('Engagement', engagement.length.toInt()),
    ChartData('House Warming', houseWarming.length.toInt()),
    ChartData('Anniversary', anniversary.length.toInt()),
    ChartData('Others', others.length.toInt()),
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

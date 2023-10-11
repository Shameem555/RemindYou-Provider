import 'package:flutter/material.dart';
import 'package:reminder/widgets/utility.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class ChartScreenAll extends StatelessWidget {
  dynamic bdy;
  dynamic wdd;
  dynamic eng;
  dynamic ann;
  dynamic hw;
  dynamic or;

  ChartScreenAll({
    super.key,
    this.bdy,
    this.wdd,
    this.eng,
    this.ann,
    this.hw,
    this.or
    });

   List<ChartData> chartData = [
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
  final String category;
  final dynamic value;
}

class Eventchart {
  var B;
  var W;
  var E;
  var A;
  var H;
  var O;


  Eventchart({
    this.B,
    this.W,
    this.E,
    this.A,
    this.H, 
    this.O
    });

static List<dynamic> birthday     = [];
static List<dynamic> wedding      = []; 
static List<dynamic> engagement   = [];
static List<dynamic> anniversary  = [];
static List<dynamic> houseWarming = [];
static List<dynamic> others       = [];
}




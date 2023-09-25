import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {

  late List <ChartData> _chartDatas;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartDatas = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.blue[300],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          title: const Text("Chart",style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,  
            ),),
          centerTitle: true,
        ),
        body: SfCircularChart(
          legend: const Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
          tooltipBehavior: _tooltipBehavior,
          series: <CircularSeries>[
          PieSeries <ChartData, String> ( 
            dataSource: _chartDatas,
            xValueMapper: (ChartData data, _)=> data.continent,
            yValueMapper:(ChartData data, _) => data.gd,
            dataLabelSettings: const DataLabelSettings(isVisible: true),
            enableTooltip: true,
          )
        ],),
      ),
    ); 
  }
  List <ChartData> getChartData(){
      final List < ChartData > chartDatas =[
        ChartData('Birthday', 3500),
        ChartData('Wedding', 1000),
        ChartData('House Warming', 2000),
        ChartData('Engagement', 2000),
        ChartData('Inaguration', 1000),
      ];
      return chartDatas;
    }
}

class ChartData {
  ChartData(this.continent,this.gd);
  final String continent;
  final int gd;
}

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  late List<ChartData> _chartdatas;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartdatas = getChartData();
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
          title: const Text(
            "Chart",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              DefaultTabController(
                  length: 3,
                  initialIndex: 0,
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: ButtonsTabBar(
                            backgroundColor: Colors.blue,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 40),
                            tabs: const [
                              Tab(
                                iconMargin: EdgeInsets.all(30),
                                text: 'All',
                              ),
                              Tab(
                                text: 'Today',
                              ),
                              Tab(
                                text: 'Yesterday',
                              ),
                            ]),
                      )
                    ],
                  )),
                  Expanded(child:
                  SfCircularChart(
            legend: const Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
            tooltipBehavior: _tooltipBehavior,
            series: <CircularSeries>[
            PieSeries <ChartData, String> (
              dataSource: _chartdatas,
              xValueMapper: (ChartData data, _)=> data.continent,
              yValueMapper:(ChartData data, _) => data.gd,
              dataLabelSettings: const DataLabelSettings(isVisible: true),
              enableTooltip: true,
            )
          ],), 
                  )
            ],
          ),
        ),
        // 
      ),
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

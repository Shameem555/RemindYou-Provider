import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:reminder/functions/events_db.dart';
import 'package:reminder/model/data_model.dart';
import 'package:reminder/widgets/screenYesterday.dart';
import 'package:reminder/widgets/screentoday.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

ValueNotifier<List<EventModel>> eventViewGraphNotifier =
    ValueNotifier(EventDB.instance.eventListNotifier.value);

class ChartScreenAll extends StatefulWidget {
  const ChartScreenAll({super.key});

  @override
  State<ChartScreenAll> createState() => _ChartScreenAllState();
}

class _ChartScreenAllState extends State<ChartScreenAll> {
  late List<ChartData> _chartdatas;
  late TooltipBehavior _tooltipBehavior;

  // @override
  // void initState() {
  //   _chartdatas = getChartData();
  //   _tooltipBehavior = TooltipBehavior(enable: true);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.orange,
        body: Container(),
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

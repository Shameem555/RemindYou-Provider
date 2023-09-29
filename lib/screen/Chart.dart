// import 'package:buttons_tabbar/buttons_tabbar.dart';
// import 'package:flutter/material.dart';
// import 'package:reminder/functions/events_db.dart';
// import 'package:reminder/model/data_model.dart';
// import 'package:reminder/widgets/screenAll.dart';
// import 'package:reminder/widgets/screenYesterday.dart';
// import 'package:reminder/widgets/screentoday.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// ValueNotifier<List<EventModel>> eventViewGraphNotifier =
//     ValueNotifier(EventDB.instance.eventListNotifier.value);

// class Chart extends StatefulWidget {
//   const Chart({super.key});

//   @override
//   State<Chart> createState() => _ChartState();
// }

// class _ChartState extends State<Chart> {
//   late List<ChartData> _chartdatas;
//   late TooltipBehavior _tooltipBehavior;

  

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       initialIndex: 0,
//       child: Scaffold(
//         backgroundColor: Colors.black,
//         appBar: AppBar(
//           bottom: const TabBar(tabs: [
//             TabBar(tabs: [
//               Tab(text: 'All'),
//               Tab(text: 'Today'),
//               Tab(text: "Yesterday"),
//             ]),
//           ]),
//           backgroundColor: Colors.blue[300],
//           shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.vertical(
//               bottom: Radius.circular(20),
//             ),
//           ),
//           title: const Text(
//             "Chart",
//             style: TextStyle(
//               fontSize: 25,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           centerTitle: true,
//         ),
//         body: const TabBarView(
//           children: [
//             ChartScreenAll(),
//             ChartScreenToday(),
//             ChartScreenYesterday()
//           ],
//         ),
//       ),
//     );
//   }

//   List<ChartData> getChartData() {
//     final List<ChartData> chartdatas = [
//       ChartData('Birthday', 3500),
//       ChartData('Wedding', 1000),
//       ChartData('House Warming', 2000),
//       ChartData('Engagement', 2000),
//       ChartData('Inaguration', 1000),
//     ];
//     return chartdatas;
//   }
// }

// class ChartData {
//   ChartData(this.continent, this.gd);
//   final String continent;
//   final int gd;
// }


import 'package:flutter/material.dart';
import 'package:reminder/widgets/screenAll.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatelessWidget {
  const Chart({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          bottom: const TabBar(tabs: [
            Tab(text: 'All'),
            Tab(text: 'Today'),
            Tab(text: "Yesterday"),
          ]),
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
        body:  TabBarView(
          children: [
            ChartScreenAll(),
            const ChartScreenToday(),
            const ChartScreenYesterday(),
          ],
        ),
      ),
    );
  }
}

// class ChartData {
//   ChartData(this.category, this.value);
//   final String category;
//   final int value;
// }

// class ChartScreenAll extends StatelessWidget {
//   ChartScreenAll({super.key});

  

  
  
//   final List<ChartData> chartData = [
//     ChartData('Birthday', 3500),
//     ChartData('Wedding', 1000),
//     ChartData('House Warming', 2000),
//     ChartData('Engagement', 2000),
//     ChartData('Inauguration', 1000),
//   ];

   

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       child: SfCircularChart(
//         legend: const Legend(
//           isVisible: true,
//           overflowMode: LegendItemOverflowMode.wrap),
//         series: <CircularSeries>[
//           // Render pie chart
//           PieSeries<ChartData, String>(
//             dataSource: chartData,
//             xValueMapper: (ChartData data, _) => data.category,
//             yValueMapper: (ChartData data, _) => data.value,
//             dataLabelSettings: const DataLabelSettings(isVisible: true),
//             enableTooltip: true,
//           ),
//         ],
//       ),
//     );
//   }
// }

class ChartScreenToday extends StatelessWidget {
  const ChartScreenToday({super.key});

  @override
  Widget build(BuildContext context) {
    // Add your chart data for "Today" here
    return Container();
  }
}

class ChartScreenYesterday extends StatelessWidget {
  const ChartScreenYesterday({super.key});

  @override
  Widget build(BuildContext context) {
    // Add your chart data for "Yesterday" here
    return Container();
  }
}

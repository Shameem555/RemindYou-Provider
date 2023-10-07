import 'package:flutter/material.dart';
import 'package:reminder/Screen/ListScreen.dart';
import 'package:reminder/main.dart';
import 'package:reminder/model/data_model.dart';
import 'package:reminder/widgets/screenAll.dart';
import 'package:reminder/widgets/screenYesterday.dart';
import 'package:reminder/widgets/screentoday.dart';
import 'package:reminder/widgets/utility.dart';

class Chart extends StatelessWidget {
  const Chart({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: ValueListenableBuilder(
         valueListenable: eventviewListNotifier,
        builder: (BuildContext ctx, List<EventModel> eventlists, Widget? child) {
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              bottom: TabBar(tabs: [
                InkWell(child: const Tab(text: 'All'),onTap: () {
                  allList(alldatalist: eventlists);
                  
                },),
                InkWell(child: const Tab(text: 'Today'),onTap: (){
                  print("today's data clicked");
                }),
                InkWell(child: const Tab(text: "Yesterday"),onTap: () {
                  print("yesterday data printed");
                },),
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
                ChartScreenToday(),
                ChartScreenYesterday(),
              ],
            ),
          );
        },
      ),
    );
  }
}

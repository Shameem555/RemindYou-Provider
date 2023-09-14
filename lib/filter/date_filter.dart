// import 'package:flutter/material.dart';

// class DateFilter extends StatefulWidget {
//   const DateFilter({super.key});

//   @override
//   State<DateFilter> createState() => _DateFilterState();
// }

// class _DateFilterState extends State<DateFilter> {
//   DateTime ? startDate, endDate;
//   @override
//   Widget build(BuildContext context) {
//     return PopupMenuButton<int>(
//       shape: ContinuousRectangleBorder(
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: const Icon(Icons.filter_list_rounded),
//       itemBuilder: (ctx)=>[
//         PopupMenuItem(value: 1, child: const Text("All"),onTap:(){},
//         ),
//         PopupMenuItem(value: 2, child: const Text("Today"),onTap:(){},
//         ),
//         PopupMenuItem(value: 3, child: const Text("Yesterday"),onTap:(){},
//         ),
//         PopupMenuItem(value: 4, child: const Text("Month"),onTap:(){},
//         ),
//       ]);
//   }
// }

//just an experiment

import 'package:flutter/material.dart';
import 'package:reminder/functions/events_db.dart';
import 'package:reminder/screen/listScreen.dart';


class DateFilter extends StatefulWidget {
  const DateFilter({
    Key? key,
  }) : super(key: key);

  @override
  State<DateFilter> createState() => _DateFilterTransactionState();
}

class _DateFilterTransactionState extends State<DateFilter> {
  DateTime? startDate, endDate;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      child: const Icon(
        Icons.filter_list_rounded,
      ),
      itemBuilder: (ctx) => [
        PopupMenuItem(
          value: 1,
          child: const Text(
            "All",
          ),
          onTap: () {
            var s = 
            eventviewListNotifier.value =
                EventsDB.instance.eventListNotifier.value;
                print(s.toList().toString());
          },
        ),
        PopupMenuItem(
          value: 2,
          child: const Text(
            "Today",
          ),
          onTap: () {
            var t =
            eventviewListNotifier.value =
                EventsDB.instance.eventListNotifier.value;
                
            eventviewListNotifier.value = eventviewListNotifier.value
                .where((element) =>
                    element.dateTime.day == DateTime.now().day &&
                    element.dateTime.month == DateTime.now().month &&
                    element.dateTime.year == DateTime.now().year)
                .toList();
                print(t.length);
          },
        ),
        PopupMenuItem(
            value: 2,
            child: const Text(
              "Yesterday",
            ),
            onTap: () {
              eventviewListNotifier.value =
                  EventsDB.instance.eventListNotifier.value;
              eventviewListNotifier.value = eventviewListNotifier.value
                  .where((element) =>
                      element.dateTime.day == DateTime.now().day - 1 ||
                      element.dateTime.month == DateTime.now().month ||
                      element.dateTime.year == DateTime.now().year)
                  .toList();
            }),
        PopupMenuItem(
            value: 2,
            child: const Text(
              "Month",
            ),
            onTap: () {
              eventviewListNotifier.value =
                  EventsDB.instance.eventListNotifier.value;
              eventviewListNotifier.value = eventviewListNotifier.value
                  .where((element) =>
                      element.dateTime.month == DateTime.now().month ||
                      element.dateTime.year == DateTime.now().year)
                  .toList();
            }),
      ],
    );
  }
}
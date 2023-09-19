import 'package:flutter/material.dart';
import 'package:reminder/Screen/listScreen.dart';
import 'package:reminder/functions/events_db.dart';

//date filtering 
class DateFilter extends StatefulWidget {
  const DateFilter({
    Key? key,
  }) : super(key: key);

  @override
  State<DateFilter> createState() => _DateFilterState();
}

class _DateFilterState extends State<DateFilter> {
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
            eventviewListNotifier.value =
                EventDB.instance.eventListNotifier.value;
                print('Working');
          },
        ),
        PopupMenuItem(
          value: 2,
          child: const Text(
            "Today",
          ),
          onTap: () {
            eventviewListNotifier.value =
                EventDB.instance.eventListNotifier.value;
            eventviewListNotifier.value = eventviewListNotifier.value
                .where((element) =>
                    element.dateTime.day == DateTime.now().day &&
                    element.dateTime.month == DateTime.now().month &&
                    element.dateTime.year == DateTime.now().year)
                .toList();
                print("working 1");
          },
        ),
        PopupMenuItem(
            value: 2,
            child: const Text(
              "Yesterday",
            ),
            onTap: () {
              eventviewListNotifier.value =
                  EventDB.instance.eventListNotifier.value;
              eventviewListNotifier.value = eventviewListNotifier.value
                  .where((element) =>
                      element.dateTime.day == DateTime.now().day - 1 &&
                      element.dateTime.month == DateTime.now().month &&
                      element.dateTime.year == DateTime.now().year)
                  .toList();
                  print('working 2');
            }),
        PopupMenuItem(
            value: 2,
            child: const Text(
              "Month",
            ),
            onTap: () {
              eventviewListNotifier.value =
                  EventDB.instance.eventListNotifier.value;
              eventviewListNotifier.value = eventviewListNotifier.value
                  .where((element) =>
                      element.dateTime.month == DateTime.now().month &&
                      element.dateTime.year == DateTime.now().year)
                  .toList();
                  print('working 3');
            }),
            //this pop up menu item is priviesly used for ui  

        // PopupMenuItem(
        //     value: 2,
        //     child: const Text(  
        //       "Date Range",
        //     ),
        //     onTap: () {
        //       showCustomDateRangePicker(context,
        //           dismissible: true,
        //           minimumDate: DateTime(2010),
        //           maximumDate: DateTime(DateTime.now().year + 500),
        //           endDate: endDate,
        //           startDate: startDate, onApplyClick: (start, end) {
        //         setState(() {
        //           endDate = end.add(const Duration(days: 1));
        //           startDate = start.subtract(const Duration(days: 1));
        //         });

        //         overViewListNotifier.value =
        //             TransactionDB.instance.transactionListNotifier.value;
        //         overViewListNotifier.value = overViewListNotifier.value
        //             .where((element) =>
        //                 element.datetime.isAfter(startDate!) &&
        //                 element.datetime.isBefore(endDate!))
        //             .toList();
        //         startDate = null;
        //         endDate = null;
        //       }, onCancelClick: () {
        //         setState(() {
        //           endDate = null;
        //           startDate = null;
        //         });
        //       },
        //           backgroundColor: Colors.white,
        //           primaryColor: const Color.fromARGB(255, 244, 98, 54));
        //       //print('start date $startDate , end date $endDate');
        //     }),
      ],
    );
  }
}
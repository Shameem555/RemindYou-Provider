import 'package:flutter/material.dart';
import 'package:reminder/functions/events_db.dart';
import 'package:reminder/screen/ListScreen.dart';

class DateFilter extends StatefulWidget {
  const DateFilter({
    Key? key,
  }) : super(key: key);

  @override
  State<DateFilter> createState() => _DateFilterState();
}

class _DateFilterState extends State<DateFilter> {
  DateTime? startDate, endDate;

  void filteration(DateTime start, DateTime end) {
    final filteredEvents = EventDB.instance.eventListNotifier.value
        .where((element) =>
            element.dateTime.isAfter(start) && element.dateTime.isBefore(end))
        .toList();
    eventviewListNotifier.value = filteredEvents;
  }

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
            //print('Working');
          },
        ),
        PopupMenuItem(
          value: 2,
          child: const Text(
            "Today",
          ),
          onTap: () {
            final now = DateTime.now();
            final today = now.subtract(const Duration(days: 1));
            final startOfDay =
                DateTime(today.year, today.month, today.day);
            final endOfDay = DateTime(
                now.year, now.month, now.day, 23, 59, 59); // End of yesterday
            filteration(startOfDay, endOfDay);
            //print('Working 2');
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
              //print('working 2');
            }),
        PopupMenuItem(
          value: 3,
          child: const Text(
            "Month",
          ),
          onTap: () {
            final now = DateTime.now();
            final startOfMonth = DateTime(now.year, now.month, 1);
            final endOfMonth = DateTime(now.year, now.month + 1, 1)
                .subtract(const Duration(days: 1));
            filteration(startOfMonth, endOfMonth);
            //print('Working 3');
          },
        ),
      ],
    );
  }
}

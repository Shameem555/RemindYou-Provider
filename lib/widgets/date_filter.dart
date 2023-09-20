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
            print('Working');
          },
        ),
        PopupMenuItem(
          value: 2,
          child: const Text(
            "Today",
          ),
          onTap: () {
            final today = DateTime.now();
            final startOfDay = DateTime(today.year, today.month, today.day);
            final endOfDay = startOfDay.add(Duration(days: 1));
            filteration(startOfDay, endOfDay);
            print("Working 1");
          },
        ),
        PopupMenuItem(
          value: 3,
          child: const Text(
            "Yesterday",
          ),
          onTap: () {
            final yesterday = DateTime.now().subtract(Duration(days: 1));
            final startOfDay = DateTime(yesterday.year, yesterday.month, yesterday.day);
            final endOfDay = startOfDay.add(Duration(days: 1));
            filteration(startOfDay, endOfDay);
            print('Working 2');
          },
        ),
        PopupMenuItem(
          value: 4,
          child: const Text(
            "Month",
          ),
          onTap: () {
            final now = DateTime.now();
            final startOfMonth = DateTime(now.year, now.month, 1);
            final endOfMonth = DateTime(now.year, now.month + 1, 1).subtract(Duration(days: 1));
            filteration(startOfMonth, endOfMonth);
            print('Working 3');
          },
        ),
      ],
    );
  }
}

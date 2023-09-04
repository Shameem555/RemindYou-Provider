import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:reminder/model/data_model.dart';

ValueNotifier<List<EventModel>> eventListNotifier = ValueNotifier([]);

Future<void> addEvent(EventModel value) async{
  final eventDB = await Hive.openBox<EventModel>("event_db");
  await eventDB.add(value);
  eventListNotifier.value.add(value);
  eventListNotifier.notifyListeners();
}

Future<void> getAllEvent()async{
  final eventDB = await Hive.openBox<EventModel>("event_db");
  eventListNotifier.value.clear();
  eventListNotifier.value.addAll(eventDB.values);
  eventListNotifier.notifyListeners();
}

Future<void> update(index, updation)async{
  final eventDB = await Hive.openBox<EventModel>("event_DB");
  await eventDB.putAt(index, updation);
  eventListNotifier.value[index]=updation;
  eventListNotifier.notifyListeners();
}

Future<void> deleteEvent(index)async{
  final eventDB = await Hive.openBox<EventModel>("event_DB");
  await eventDB.deleteAt(index);
  getAllEvent();
}

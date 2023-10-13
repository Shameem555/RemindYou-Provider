import 'package:hive_flutter/hive_flutter.dart';
import 'package:reminder/functions/events_db.dart';
import 'package:reminder/model/data_model.dart';

clearappdata() async {
  await Hive.openBox<EventModel>("data");
  await EventDB.instance.getAllEvent();
}
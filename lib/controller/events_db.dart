import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:reminder/model/data_model.dart';


class EventDB extends ChangeNotifier {
 
  List<EventModel> eventList=[];

  List<EventModel> filtereventList=[];
 

    void filteration(DateTime start, DateTime end) {
    final filteredEvents = eventList
        .where((element) =>
            element.dateTime.isAfter(start) && element.dateTime.isBefore(end))
        .toList();
  filtereventList= filteredEvents;
  notifyListeners();
  }

  Future<void> addEvent(EventModel value) async{
    final eventDB = await Hive.openBox<EventModel>("event_db");
      await eventDB.add(value);
   eventList.add(value);
    getAllEvent();
  }

  Future<void> getAllEvent()async{
    final eventDB = await Hive.openBox<EventModel>("event_db");
    eventList.clear();
    eventList.addAll(eventDB.values);
    // to build the items or list
   notifyListeners();
  }
 
  Future<void> update(index, updation)async{
    final eventDB = await Hive.openBox<EventModel>("event_DB");
      await eventDB.putAt(index, updation);
   eventList[index]=updation;
    notifyListeners();
    getAllEvent();
  }
  
  Future<void> deleteEvents(int index) async {
    final eventDB = await Hive.openBox<EventModel>("event_DB");
      await eventDB.deleteAt(index);
    notifyListeners();
    getAllEvent();
  }

}

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:reminder/model/data_model.dart';
import 'package:reminder/screen/listScreen.dart';

class EventDB extends ChangeNotifier {
  EventDB.internal();

  static EventDB instance = EventDB.internal();

  factory EventDB(){
    return instance;
  }

  //begans 

  ValueNotifier<List<EventModel>> eventListNotifier = ValueNotifier([]);

  Future<void> addEvent(EventModel value) async{
    final eventDB = await Hive.openBox<EventModel>("event_db");
      await eventDB.add(value);
    eventListNotifier.value.add(value);
    //eventListNotifier.notifyListeners();
    getAllEvent();
    //overViewListNotifier.notifyListeners();
  }

  Future<void> getAllEvent()async{
    final eventDB = await Hive.openBox<EventModel>("event_db");
    eventListNotifier.value.clear();
    eventListNotifier.value.addAll(eventDB.values);
    eventviewListNotifier.notifyListeners();
    // overViewListNotifier.notifyListeners();
  }
 
  Future<void> update(index, updation)async{
    final eventDB = await Hive.openBox<EventModel>("event_DB");
      await eventDB.putAt(index, updation);
    eventListNotifier.value[index]=updation;
     notifyListeners();
    eventListNotifier.notifyListeners();
    getAllEvent();
    //overViewListNotifier.notifyListeners();
  }
  
  Future<void> deleteEvents(int index) async {
  final eventDB = await Hive.openBox<EventModel>("event_DB");
    await eventDB.deleteAt(index);
  eventDB.close(); // Close the box after deleting the item.
  eventviewListNotifier.notifyListeners();
  getAllEvent();
}

  //  deleteEvents(int index)async{
  //   final eventDB = await Hive.openBox<EventModel>("event_DB");
  //     await eventDB.delete(index);
  //   eventviewListNotifier.notifyListeners();
  //   getAllEvent();
  // }
}
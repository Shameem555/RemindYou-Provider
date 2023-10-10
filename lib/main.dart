import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:reminder/functions/events_db.dart';
import 'package:reminder/model/data_model.dart';
import 'package:reminder/widgets/bottomBar.dart';

//object for db to accesss
EventDB eventlist = EventDB();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(EventModelAdapter().typeId)) {
    Hive.registerAdapter(EventModelAdapter());
  }

  await Hive.openBox<EventModel>("data");
  await EventDB.instance.getAllEvent();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application. 
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Reminder',
      home: BottomBar(),
    );
  }
}
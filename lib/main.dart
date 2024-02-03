import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:reminder/controller/bottombar-provider.dart';
import 'package:reminder/controller/edit-provider.dart';
import 'package:reminder/controller/event-provider.dart';
import 'package:reminder/controller/listscreen-provider.dart';
import 'package:reminder/controller/login-provider.dart';
import 'package:reminder/service/events_db.dart';
import 'package:reminder/model/data_model.dart';
import 'package:reminder/widgets/splashscreen.dart';

const saveKeyName = 'User logged in';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); 
  if (!Hive.isAdapterRegistered(EventModelAdapter().typeId)) {
    Hive.registerAdapter(EventModelAdapter());
  } 
  await Hive.openBox<EventModel>("data");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:  [
        ChangeNotifierProvider(create: (context) => BottomProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => EventProvider()),
        ChangeNotifierProvider(create: (context) => ListProvider()),
        ChangeNotifierProvider(create: (context) => EditProvider()),
        ChangeNotifierProvider(create: (context) => EventDB()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Reminder',
        home: ScreenSplash(),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:reminder/Screen/AddEvent.dart';
// import 'package:reminder/controller/events_db.dart';
import 'package:reminder/filter/date_filter.dart';
import 'package:reminder/screen/ListScreen.dart';

//list screen search vere
class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {

  // @override
  // void initState() {
  //   eventviewListNotifier.value =
  //       EventDB.instance.eventListNotifier.value;
  //   super.initState();
  // }
  
  @override
  Widget build(BuildContext context) {
 // eventviewListNotifier.notifyListeners();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.blue[300],
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          title: const Text(
            " Events List",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: const [
             DateFilter(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const AddEvent(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
        body: 
        const Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
               Expanded(
                child: ListScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
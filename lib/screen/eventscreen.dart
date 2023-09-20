import 'package:flutter/material.dart';
import 'package:reminder/Screen/AddEvent.dart';
import 'package:reminder/functions/events_db.dart';
import 'package:reminder/widgets/date_filter.dart';
import 'package:reminder/screen/ListScreen.dart';

//list screen search vere
class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {

  @override
  void initState() {
    eventviewListNotifier.value =
        EventDB.instance.eventListNotifier.value;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
      // eventDB.close(); 
  eventviewListNotifier.notifyListeners();
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
            // PopupMenuButton(
            //   itemBuilder: (context) => [
            //     PopupMenuItem(
            //       child: Row(
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.only(left: 10.0),
            //             child: TextButton(
            //               onPressed: () {},
            //               child: const Text("All"),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //     PopupMenuItem(
            //       child: Row(
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.only(left: 10.0),
            //             child: TextButton(
            //               onPressed: () {},
            //               child: const Text("Today"),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //     PopupMenuItem(
            //       child: Row(
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.only(left: 10.0),
            //             child: TextButton(
            //               onPressed: () {},
            //               child: const Text("Month"),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //     PopupMenuItem(
            //       child: Row(
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.only(left: 10.0),
            //             child: TextButton(
            //               onPressed: () {},
            //               child: const Text("Year"),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ],
            //   icon: const Icon(Icons.filter_list),
            // ),

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
              //SearchField(),
              // Container(
              //   height: 55,
              //   width: 360,
              //   decoration: BoxDecoration(
              //     border: Border.all(color: Colors.white),
              //     borderRadius: BorderRadius.circular(20),
              //     color: Colors.white,
              //   ),
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child:
              //          TextFormField(
              //           decoration: const InputDecoration(
              //             hintText: 'Search',
              //             hintStyle: TextStyle(fontSize: 20),
              //             border: InputBorder.none,
              //             contentPadding: EdgeInsets.symmetric(horizontal: 10),
              //           ),
              //         ),
              //       ),
              //       IconButton(
              //         onPressed: () {},
              //         icon: const Icon(Icons.search_rounded),
              //       ),
              //     ],
              //   ),
              // ),
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
import 'package:flutter/material.dart';
import 'package:reminder/functions/events_db.dart';
import 'package:reminder/main.dart';
import 'package:reminder/model/data_model.dart';
import 'package:reminder/subscreen/editscreen.dart';

ValueNotifier<List<EventModel>> eventviewListNotifier = 
ValueNotifier(EventDB.instance.eventListNotifier.value);

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  ListScreenState createState() => ListScreenState();
}




class ListScreenState extends State<ListScreen> {

//just for an experiment, may be delete the code 

  // @override
  // void initState() {
  //   eventviewListNotifier.value =
  //       EventDB.instance.eventListNotifier.value;
  //   super.initState();
  // }

  //this is for search bar 
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  List<EventModel> filteredLists = [];
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
      // eventDB.close(); // Close the box after deleting the item.
  eventviewListNotifier.notifyListeners();
    eventlist.getAllEvent(); // You may need to load your events initially.
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              SearchField(
                controller: _searchController,
                onSearch: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: eventviewListNotifier,
                  builder: (BuildContext ctx, List<EventModel> eventlists, Widget? child) {
                    List<EventModel> eventList = isSearching
                        ? filteredLists
                        : eventlists.where((event) {
                            final title = event.title.toLowerCase();
                            return title.contains(_searchQuery.toLowerCase());
                          }).toList();
                    if (eventList.isEmpty) {
                      return const Center(
                        child: Text(
                          "ഇതിൽ ഒന്നും ഇല്ല",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      );
                    }
                    return ListView.separated(
                      itemBuilder: (ctx, index) {
                        final data = eventList[index];
                        return Card(
                          elevation: 2,
                          child: ListTile(
                            title: Text(data.title),
                            subtitle: Text(
                                '${data.dateTime.day}/${data.dateTime.month}/${data.dateTime.year}'),
                            trailing: PopupMenuButton(
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10.0),
                                        child: TextButton(
                                          onPressed: () {
                                            // to edit
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                     EditScreen(
                                                      index: index,
                                                      name: data.title, 
                                                      select: data.catogory, 
                                                      dates: data.dateTime,
                                                     ),
                                              ),
                                            );
                                          },
                                          child: const Text("Edit"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                PopupMenuItem(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 10.0),
                                        child: TextButton(
                                          onPressed: () {
                                            setState(() {
                                               eventlist.deleteEvents(index);
                                            });
                                           
                                            
                                            Navigator.of(context).pop();
                                            //to delete the listview item 
                                          },
                                          child: const Text('Delete'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                              icon: const Icon(Icons.more_vert_rounded),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (ctx, index) {
                        return const SizedBox(
                          height: 5,
                        );
                      },
                      //the listview count .
                      itemCount: eventList.length,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//search field widget
class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSearch;
  
  const SearchField({super.key, required this.controller, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 360,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            //text form field widget 
            child: TextFormField(
              controller: controller,
              onChanged: onSearch,
              decoration: const InputDecoration(
                hintText: 'Search',
                //prefixIcon: Icon(Icons.search_rounded),
                hintStyle: TextStyle(fontSize: 20),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          ),
          //search icon 
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          )
        ],
      ),
    );
  }
}

void reload(){

}

// there is some experimental things

// import 'package:flutter/material.dart';

// class DateFilter extends StatefulWidget {
//   const DateFilter({Key? key}) : super(key: key);

//   @override
//   State<DateFilter> createState() => _DateFilterTransactionState();
// }

// class _DateFilterTransactionState extends State<DateFilter> {
//   // ... (other code)

//   @override
//   Widget build(BuildContext context) {
//     return PopupMenuButton<int>(
//       // ... (other code)

//       itemBuilder: (ctx) => [
//         PopupMenuItem(
//           value: 1,
//           child: const Text("All"),
//           onTap: () {
//             // Filter for all events
//             setState(() {
//               isSearching = false;
//             });
//           },
//         ),
//         PopupMenuItem(
//           value: 2,
//           child: const Text("Today"),
//           onTap: () {
//             // Filter for events happening today
//             setState(() {
//               isSearching = true;
//               filteredLists = eventlists.where((element) {
//                 final date = element.dateTime;
//                 final now = DateTime.now();
//                 return date.year == now.year &&
//                     date.month == now.month &&
//                     date.day == now.day;
//               }).toList();
//             });
//           },
//         ),
//         PopupMenuItem(
//           value: 3,
//           child: const Text("Yesterday"),
//           onTap: () {
//             // Filter for events happening yesterday
//             setState(() {
//               isSearching = true;
//               filteredLists = eventlists.where((element) {
//                 final date = element.dateTime;
//                 final now = DateTime.now().subtract(Duration(days: 1));
//                 return date.year == now.year &&
//                     date.month == now.month &&
//                     date.day == now.day;
//               }).toList();
//             });
//           },
//         ),
//         PopupMenuItem(
//           value: 4,
//           child: const Text("Month"),
//           onTap: () {
//             // Filter for events happening this month
//             setState(() {
//               isSearching = true;
//               filteredLists = eventlists.where((element) {
//                 final date = element.dateTime;
//                 final now = DateTime.now();
//                 return date.year == now.year && date.month == now.month;
//               }).toList();
//             });
//           },
//         ),
//       ],
//     );
//   }
// }



 import 'package:flutter/material.dart';
import 'package:reminder/functions/events_db.dart';
import 'package:reminder/main.dart';
import 'package:reminder/model/data_model.dart';
import 'package:reminder/subscreen/editscreen.dart';
import 'package:reminder/widgets/searchfield.dart';

ValueNotifier<List<EventModel>> eventviewListNotifier =
ValueNotifier(EventDB.instance.eventListNotifier.value);

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  ListScreenState createState() => ListScreenState();
}

class ListScreenState extends State<ListScreen> {

  //this is for search bar 
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  List<EventModel> filteredLists = [];
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
  eventviewListNotifier.notifyListeners();
    EventDB.instance.getAllEvent(); // You may need to load your events initially.
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.only(top: 0),
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
                      reverse: false,
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
                                            //alert will form in here !!
                                            showDialog(context: context, builder: (BuildContext context){
                                              return AlertDialog(
                                                title: const Text("ഒരു സംശയം..!"),
                                                content: const Text("ഒറപ്പന്നെ അല്ലേ, അപ്പൊ കളയട്ടേ..?"),
                                                actions: [
                                                  TextButton(onPressed: (){
                                                    Navigator.of(context).pop();
                                                  }, child: const Text("Cancel"),),
                                                  TextButton(onPressed: (){
                                               eventlist.deleteEvents(index);
                                            Navigator.of(context).pop();
                                                  }, child: const Text("Ok"),),
                                                ],
                                              );
                                            });
                                            // //to delete the listview item 
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

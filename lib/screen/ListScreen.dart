import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminder/controller/events_db.dart';
import 'package:reminder/controller/listscreen-provider.dart';
import 'package:reminder/model/data_model.dart';
import 'package:reminder/screen/editscreen.dart';
import 'package:reminder/filter/searchfield.dart';


  
class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  ListScreenState createState() => ListScreenState();
}

class ListScreenState extends State<ListScreen> {


  @override
  Widget build(BuildContext context) {
    Provider.of<EventDB>(context).getAllEvent();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Consumer<ListProvider>(
            builder: (context, provider, child) {
              return 
             Column(
              children: [
                SearchField(
                  controller: provider.searchController,
                  onSearch: (value) {
                    provider.updateSearch(value);
                    // setState(() {
                      // provider.searchQuery = value;
                    // });
                  },
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Consumer<EventDB>(
                    builder: ( ctx,evntdbprovider, child) { 
                      List<EventModel> eventList = provider.isSearching
                          ? provider.filteredLists
                          :evntdbprovider.eventList.where((event) {
                              final title = event.title.toLowerCase();
                              return title.contains(provider.searchQuery.toLowerCase());
                            }).toList();
                      if (eventList.isEmpty) {
                        return const Center(
                          child: Text(
                            "No data",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        );
                      }
                      return ListView.separated(
                        //reverse: false,
                        itemBuilder: (ctx, index) {
                          final data = eventList[index];
                          return Card(
                            elevation: 2,
                            child: ListTile(
                              title: Text(data.title,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
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
                                              // To edit
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
                                                  title: const Text("conformation!"),
                                                  content: const Text("Are you sure"),
                                                  actions: [
                                                    TextButton(onPressed: (){
                                                      Navigator.of(context).pop(false);
                                                    }, child: const Text("Cancel"),),
                                                    TextButton(onPressed: (){
                                                      // setState(() {
                                                    evntdbprovider.deleteEvents(index);
          
                                                      // });
                                              Navigator.of(context).pop(true);
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
            );
            },
          ),
        ),
      ),
    );
  }
}

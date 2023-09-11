import 'package:flutter/material.dart';
import 'package:reminder/functions/events_db.dart';
import 'package:reminder/model/data_model.dart';
import 'package:reminder/subscreen/editscreen.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  ListScreenState createState() => ListScreenState();
}

class ListScreenState extends State<ListScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  List<EventModel> filteredLists = [];
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    getAllEvent(); // You may need to load your events initially.
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
                  valueListenable: eventListNotifier,
                  builder: (BuildContext ctx, List<EventModel> eventlist, Widget? child) {
                    List<EventModel> eventList = isSearching
                        ? filteredLists
                        : eventlist.where((event) {
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
                                                    const EditScreen(),
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
                                            deleteEvents(index);
                                            Navigator.of(context).pop();
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
            child: TextFormField(
              controller: controller,
              onChanged: onSearch,
              decoration: const InputDecoration(
                hintText: 'Search',
               // prefixIcon: Icon(Icons.search_rounded),
                hintStyle: TextStyle(fontSize: 20),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          )
        ],
      ),
    );
  }
}




import 'package:flutter/material.dart';
import 'package:reminder/functions/events_db.dart';
import 'package:reminder/model/data_model.dart';

class SearchField extends StatefulWidget {
  const SearchField({super.key});

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  TextEditingController searchController = TextEditingController();
  List<EventModel> filteredLists = [];
  bool isSearching = false;

  @override
  initState() {
    super.initState();
    searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    setState(() {
      if (searchController.text.isEmpty) {
        isSearching = false;
        filteredLists = [];
      } else {
        isSearching = true;
        filteredLists = eventListNotifier.value
            .where((task) => task.title
                .toLowerCase()
                .contains(searchController.text.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    eventListNotifier.notifyListeners();
    return Container(
      height: 60,
      width: 360,
      decoration: BoxDecoration(
        //border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: TextField(
                controller: searchController,
                decoration: const InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search_rounded),
                  filled: true,
                  hintStyle: TextStyle(fontSize: 20),
                  border: InputBorder.none,
                  //contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              searchController.clear();
            },
            icon: const Icon(Icons.clear),
          ),
        ],
      ),
    );
  }
}
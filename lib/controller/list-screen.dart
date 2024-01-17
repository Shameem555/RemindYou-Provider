import 'package:flutter/material.dart';
import 'package:reminder/model/data_model.dart';

class ListProvider extends ChangeNotifier{
    final TextEditingController searchController = TextEditingController();
  String searchQuery = '';
  List<EventModel> filteredLists = [];
  bool isSearching = false;

  void updateSearch(String value) {
    searchQuery = value;
    notifyListeners();
  }
}
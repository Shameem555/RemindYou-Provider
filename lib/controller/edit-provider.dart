import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
// import 'package:reminder/functions/events_db.dart';
import 'package:reminder/model/data_model.dart';

class EditProvider extends ChangeNotifier{
  

  final box = Hive.box<EventModel>("data");
  dynamic tittleControl;
   String? select;

   DateTime date = DateTime.now();

//for catogory selection//
  final List<Map> myOption = [
    {
      'Category': '1',
      'name': 'Birthday',
    },
    {
      'Category': '2',
      'name': 'Wedding',
    },
    {
      'Category': '3',
      'name': 'Engagement',
    },
    {
      'Category': '4',
      'name': 'House Warming',
    },
    {
      'Category': '5',
      'name': 'Anniversary',
    },
    {
      'Category': '6',
      'name': 'Others',
    },
  ];

  void updateDate(DateTime newDate) {
    date = newDate;
    notifyListeners();
  }

  void updateCatogory(String newValue){
    select = newValue;
    notifyListeners();
  }

} 
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:reminder/model/data_model.dart';

class EventProvider extends ChangeNotifier{
  final box = Hive.box<EventModel>("data");

  DateTime date = DateTime.now();

  //for catogory selection//
  String? option;

  //for the validation
  final formKey = GlobalKey<FormState>();

  void submitform() {
    if (formKey.currentState!.validate()) {}
  }

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

  final titleController = TextEditingController();
}
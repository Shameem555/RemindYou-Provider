import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:reminder/main.dart';
import 'package:reminder/model/data_model.dart';
import 'package:reminder/screen/eventscreen.dart';
// import 'package:reminder/screen/listScreen.dart';

class EventProvider extends ChangeNotifier{
  final box = Hive.box<EventModel>("data");

  DateTime date = DateTime.now();
  final titleController = TextEditingController();

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


    Future<void> onAddEventButton(BuildContext context) async {
  
    final model = EventModel(
      title:titleController.text,  
      //timeOfDay: _selectedTime,
      dateTime: date,
      catogory: option!,
    );
    //to add event
    eventlist.addEvent(model);
    Navigator.of(context).pushReplacement(  
      MaterialPageRoute(
        builder: (context) =>  const EventScreen(),
      ),
       
       
    
    );
    titleController.clear();
   date= DateTime.now();
   option = null;
    notifyListeners();  
  }
    void updateSelectedOption(String? newValue) {
    option = newValue;
    notifyListeners();
  }
}

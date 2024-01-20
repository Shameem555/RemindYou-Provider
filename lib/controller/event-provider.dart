import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:reminder/controller/events_db.dart';
// import 'package:reminder/functions/events_db.dart';
// import 'package:reminder/main.dart';
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
    Provider.of<EventDB>(context,listen: false).addEvent(model);
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
    void updateSelection(String? newValue) {
    option = newValue;
    notifyListeners();
  }

  List<EventModel> _eventModel = [];

  List<EventModel> get eventModel => _eventModel;

  void setEventModel(List<EventModel> eventModel) {
    _eventModel = eventModel;
    notifyListeners();
  }

  void updateDate(DateTime newDate) {
    date = newDate;
    notifyListeners();
  }
}

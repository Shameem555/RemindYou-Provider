import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reminder/screen/ListScreen.dart';

class AddEvent extends StatefulWidget {
  const AddEvent({super.key});

  @override
  State<AddEvent> createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  
  DateTime date = DateTime.now();

  //for catogory selection//
  String? _option;
  final List<Map> _myOption = [
    {
      'Category': '1',
      'name': 'Select',
    },
    {
      'Category': '2',
      'name': 'Birthday',
    },
    {
      'Category': '3',
      'name': 'Wedding',
    },
    {
      'Category': '4',
      'name': 'Inaguration',
    },
    {
      'Category': '5',
      'name': 'Engagement',
    },
    {
      'Category': '6',
      'name': 'Farewell',
    },
    {
      'Category': '7',
      'name': 'House Warming',
    },
    {
      'Category': '8',
      'name': 'wedding Anniversary',
    },
    {
      'Category': '9',
      'name': 'others',
    },
  ];

  //time picker
  TimeOfDay _selectedTime = TimeOfDay.now();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (pickedTime != null && pickedTime != _selectedTime) {
      setState(() {
        _selectedTime = pickedTime;
      });
    }
  }
  //end time picker

  //all text controller//
  final _titleController = TextEditingController();

  final _categoryController = TextEditingController();

  final _datetimeController = TextEditingController();

  final _timeController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        title: const Text(
          "Add Event",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: const [
          Icon(
            Icons.calendar_month_rounded,
            size: 28,
          ),
          SizedBox(
            width: 20,
          )
        ],
        backgroundColor: Colors.blue[300],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.purple),
                  width: 350,
              height: 55,
              child: TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  hintText: "Title",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintStyle: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
          //Category selection
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10),
            child: Container(
              height: 57,
              width: 350,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.purple,
                border: Border.all(width: 1, color: Colors.purple),
              ),
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton(
                    hint: const Text(
                      'Select Category',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    value: _option,
                    onChanged: (newValue) {
                      setState(
                        () {
                          _option = newValue!;
                        },
                      );
                    },
                    items: _myOption.map(
                      (addCategory) {
                        return DropdownMenuItem(
                          value: addCategory['Category'].toString(),
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: Text(addCategory['name']),
                              ),
                            ],
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
            ),
          ),
          //date demo
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10),
            child: Container(
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  width: 2,
                  color: Colors.purple,
                ),
              ),
              width: 350,
              height: 55,
              child: TextButton(
                onPressed: () async {
                  DateTime? newDate = await showDatePicker(
                      context: context,
                      initialDate: date,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2100));
                  if (newDate == null) return;
                  setState(
                    () {
                      date = newDate;
                    },
                  );
                },
                child: Text(
                  'Date : ${date.year}/${date.day}/${date.month}',
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          //time picker
          Center(
            child: GestureDetector(
              onTap: () => _selectTime(context),
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 15),
                child: Container(
                  width: 350,
                  height: 60,
                  padding: const EdgeInsets.only(top: 10, left: 15),
                  //color: Colors.blue,
                  child: Text(
                    _selectedTime.format(context), // Display selected time
                    style: const TextStyle(
                      color: Colors.white, 
                      fontSize: 24,
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.purple),
                ),
              ),
            ),
          ),

          //time picker end
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 40),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop(
                        MaterialPageRoute(builder: (context) => const ListScreen(),),);
                  },
                  child: Container(
                    width: 120,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.cyan),
                    child: const Center(
                        child: Text(
                      "Cancel",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 70),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop(
                        MaterialPageRoute(builder: (context) => const ListScreen()));
                  },
                  child: Container(
                    width: 120,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.cyan),
                    child: const Center(
                        child: Text(
                      "Ok",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:reminder/model/data_model.dart';
import 'package:reminder/screen/ListScreen.dart';
import 'package:reminder/screen/eventscreen.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final box = Hive.box<EventModel>("data");

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

  // text controller//
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
          title: const Text(
            "Edit Event",
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
                    hintStyle:
                        const TextStyle(color: Colors.white, fontSize: 20),
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
                height: 57,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.purple,
                  border: Border.all(width: 1, color: Colors.purple),
                ),
                child: TextButton(
                  onPressed: () async {
                    DateTime? newDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2100));
                    if (newDate == null) {
                      return;
                    } else {
                      setState(() {
                        date = newDate;
                      });
                    }
                  },
                  child: Text(
                    'Date : ${date.year}/${date.month}/${date.day}',
                    style: const TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 40),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop(
                        MaterialPageRoute(
                          builder: (context) =>  ListScreen(),
                        ),
                      );
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
                  child: GestureDetector(
                    onTap: () {
                      onAddEventButton(context);
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
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onAddEventButton(BuildContext context) async {
    final model = EventModel(
      title: _titleController.text,
      //timeOfDay: _selectedTime,
      dateTime: date,
      catogory: _option!,
    );
    //update(context,model);

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const EventScreen()));
  }
}

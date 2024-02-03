import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminder/controller/edit-provider.dart';
import 'package:reminder/service/events_db.dart';
import 'package:reminder/model/data_model.dart';
import 'package:reminder/screen/ListScreen.dart';

// ignore: must_be_immutable
class EditScreen extends StatefulWidget {
  var name;
  var select;
  var dates;
  int index;

  EditScreen(
      {super.key,
      required this.name,
      required this.select,
      required this.dates,
      required this.index});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  void initState() {
    final provider = Provider.of<EditProvider>(context, listen: false);
    provider.tittleControl = TextEditingController(text: widget.name);
    provider.select = widget.select;
    provider.date = widget.dates;
    super.initState();
  }

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
        body: Consumer<EditProvider>(
          builder: (context, provider, child) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    width: 350,
                    height: 55,
                    child: TextFormField(
                      controller: provider.tittleControl,
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
                      color: Colors.white,
                      border: Border.all(width: 1, color: Colors.purple),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton(
                          hint: const Text(
                            'Select Category',
                            style: TextStyle(
                                color: Colors.blueAccent, fontSize: 20),
                          ),
                          value: provider.select,
                          onChanged: (newValue) {
                            provider.updateCatogory(newValue!);
                          },
                          items: provider.myOption.map(
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
                      color: Colors.white,
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
                          provider.updateDate(newDate);
                        }
                      },
                      child: Text(
                        'Date : ${provider.date.year}/${provider.date.month}/${provider.date.day}',
                        style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
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
                              builder: (context) => const ListScreen(),
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
                          Navigator.of(context).pop();
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
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<void> onAddEventButton(BuildContext context) async {
    final provider = Provider.of<EditProvider>(context, listen: false);
    final updation = EventModel(
      title: provider.tittleControl.text,
      dateTime: provider.date,
      catogory: provider.select!,
    );
    Provider.of<EventDB>(context, listen: false).update(widget.index, updation);
  }
}

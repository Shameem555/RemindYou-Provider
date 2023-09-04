import 'package:flutter/material.dart';
import 'package:reminder/functions/db_functions.dart';
import 'package:reminder/model/data_model.dart';
import 'package:reminder/screen/AddEvent.dart';

class ListScreen extends StatelessWidget {

  // final Title;
  // final Category;
  // final DateTime;
  // final TimeOfDay;

  // ListScreen({Key? key, this.Title, this.Category, this.DateTime, this.TimeOfDay}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    getAllEvent();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        title: const Text(" Events List",style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const AddEvent(),),);
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
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
                      decoration: const InputDecoration(
                        hintText: 'Search',
                        hintStyle: TextStyle(fontSize: 20),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search_rounded),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: eventListNotifier,
                builder: (BuildContext ctx,
                List<EventModel>eventList, Widget? child){
                  return SingleChildScrollView(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final data = eventList[index];
                        return ListTile(
                          title: Text(data.title,style: TextStyle(color: Colors.white),),
                          subtitle: Text(data.timeOfDay),
                          trailing: Text(data.dateTime as String),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemCount: eventList.length,
                    ),
                  );
                }
                ),
              ),
          ],
        ),
      ),
    );
  }
}

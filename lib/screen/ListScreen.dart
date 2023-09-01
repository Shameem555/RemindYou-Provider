

import 'package:flutter/material.dart';
import 'package:reminder/screen/AddEvent.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const AddEvent(),),);
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
              child: ListView(
                children: const [
                  EventCard(
                    title: "Birthday", 
                    subtitle: "8:00 AM",
                    trailing: "Aug 23",
                  ),
                  EventCard(
                    title: "Meeting",
                    subtitle: "2:30 PM",
                    trailing: "Aug 24",
                  ),
                  EventCard(
                    title: "Appointment",
                    subtitle: "10:00 AM",
                    trailing: "Aug 25",
                  ),
                  EventCard(
                    title: "Wedding",
                    subtitle: "12:00 pM",
                    trailing: "Aug 25",
                  ),
                  EventCard(
                    title: "Engagement",
                    subtitle: "10:00 AM",
                    trailing: "Aug 25",
                  ),
                  EventCard(
                    title: "Onam Celebration",
                    subtitle: "09:00 AM",
                    trailing: "Aug 25",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String trailing;

  const EventCard({super.key, 
    required this.title,
    required this.subtitle,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: ListTile(
        title: Text(title,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle,style: const TextStyle(fontSize: 15,),),
        trailing: Text(trailing,style: const TextStyle(fontSize: 17,),),
      ),
    );
  }
}

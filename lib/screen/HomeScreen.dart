
import 'package:flutter/material.dart';
import 'package:one_clock/one_clock.dart';
import 'package:reminder/functions/db_functions.dart';
import 'package:reminder/screen/ListScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    getAllEvent();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        title: const Text(
          " Home",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[300],
      ),
      body: Column(
        children: [
          Padding(
            padding:  const EdgeInsets.all(13.0),
            child: SizedBox(
              width: 210,
              height: 210,
              child: AnalogClock(
                decoration: BoxDecoration(
                    border: Border.all(width: 5.0, color: Colors.white),
                    color: const Color.fromARGB(0, 59, 201, 217),
                    shape: BoxShape.circle),
                width: 150.0,
                isLive: true,
                hourHandColor: Colors.white,
                minuteHandColor: Colors.white,
                showSecondHand: true,
                numberColor: Colors.greenAccent,
                showNumbers: true,
                showAllNumbers: false,
                textScaleFactor: 1.5,
                showTicks: true,
                showDigitalClock: true,
                datetime: DateTime(2019, 1, 1, 9, 12, 15),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 5, left: 20),
                child: Text(
                  "Events:",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, right: 15),
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>  ListScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "See All",
                    style: TextStyle(color: Colors.white, fontSize: 23),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView(
              children: const [
                // EventCard(
                //   title: "Birthday",
                //   subtitle: "8:00 AM",
                //   trailing: "Aug 23",
                // ),
                // EventCard(
                //   title: "Meeting",
                //   subtitle: "2:30 PM",
                //   trailing: "Aug 24",
                // ),
                // EventCard(
                //   title: "Appointment",
                //   subtitle: "10:00 AM",
                //   trailing: "Aug 25",
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class EventCard extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final String trailing;

//   const EventCard({super.key, 
//     required this.title,
//     required this.subtitle,
//     required this.trailing,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 2,
//       margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//       child: ListTile(
//         title: Text(
//           title,
//           style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//         ),
//         subtitle: Text(
//           subtitle,
//           style: const TextStyle(
//             fontSize: 15,
//           ),
//         ),
//         trailing: Text(
//           trailing,
//           style: const TextStyle(
//             fontSize: 17,
//           ),
//         ),
//       ),
//     );
//   }
// }

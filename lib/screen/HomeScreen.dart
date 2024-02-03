import 'package:flutter/material.dart';
import 'package:one_clock/one_clock.dart';
import 'package:provider/provider.dart';
import 'package:reminder/screen/eventscreen.dart';
import 'package:reminder/screen/homedisplayscreen.dart';
import 'package:reminder/service/events_db.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<EventDB>(context).getAllEvent();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          //to avoid the push routing
          automaticallyImplyLeading: false,
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
              padding: const EdgeInsets.all(13.0),
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
                  hourHandColor: Colors.blue,
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
                          builder: (context) => const EventScreen(),
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
            const Expanded(
              child: DisplayScreen(),
            ),
          ],
        ),
      ),
    );
  }
}

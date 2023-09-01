import 'package:flutter/material.dart';

class Terms extends StatelessWidget {
  const Terms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Terms & Conditions"),
        centerTitle: true,
        backgroundColor: Colors.blue[300],
        actions: const [
          Icon(Icons.content_paste, size: 25),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text("""Welcome to Reminder!

     These terms and conditions outline the rules and regulations for the use of Reminder's Reminder App, located at Reminder App's Website or Play Store Page.

By accessing this app, we assume you accept these terms and conditions. Do not continue to use Reminder if you do not agree to take all of the terms and conditions stated on this page.

The following terminology applies to these Terms and Conditions, Privacy Statement, and Disclaimer Notice and all Agreements: "Client", "You", and "Your" refers to you, the person log on 
this app and compliant to the Company's terms and conditions. "The Company", "Ourselves", "We", "Our", and "Us", refers to our Company. "Party", "Parties", or "Us", refers to both the Client and ourselves. 
All terms refer to the offer, acceptance, and consideration of payment necessary to undertake the process of our assistance to the Client in the most appropriate manner for the express purpose of meeting 
the Client's needs in respect of the provision of the Company's stated services, in accordance with and subject to the prevailing law of india. Any use of the above terminology or other words in 
the singular, plural, capitalization, and/or he/she or they, are taken as interchangeable and therefore as referring to the same.""",style: TextStyle(color: Colors.white,fontSize: 18 ),),
        ),
      ),
    );
  }
}

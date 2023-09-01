import 'package:flutter/material.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //the scafford theme to be white to black
      backgroundColor: Colors.black,
      appBar: AppBar(
        //for the app bar color
        backgroundColor: Colors.blue[300],
        title: const Text(
          "Privacy Policy",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        //to be get icon in app bar
        actions: const [
          Icon(
            Icons.privacy_tip,
            size: 25,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            """Privacy Policy for Reminder

1. Introduction

Welcome to Reminder! This Privacy Policy outlines how we collect, use, disclose, and protect the personal information of users who access our Flutter mobile application ("App"). By using the App, you consent to the practices described in this Privacy Policy.

2. Information We Collect

- **Personal Information**: We do not collect personal information such as names, addresses, or contact details.
- **Reminders and Notes**: The App allows you to create and store reminders and notes on your device. These are stored locally and are not transmitted or accessible by us.
- **Usage Data**: We may collect usage information like device type, app version, and interactions within the App. This data helps us improve the user experience.

3. How We Use Your Information

- **Personal Information**: Since we do not collect personal information, we do not use or share it.
- **Reminders and Notes**: Your reminders and notes are stored only on your device and are not used by us.
- **Usage Data**: We use usage data for analytics purposes to enhance the App's functionality, performance, and user experience.

4. Data Security

We take reasonable measures to protect your data, but no method of transmission over the internet or electronic storage is completely secure. Your data remains on your device and is not stored on our servers.

5. Children's Privacy

Our App is not intended for children under the age of 7. We do not knowingly collect personal information from individuals under 7. If we learn that we have inadvertently collected such data, we will delete it.

6. Changes to Privacy Policy

We reserve the right to update this Privacy Policy at any time. Changes will be posted in the App, and your continued use constitutes acceptance of the updated policy.

7. Contact Us: __shamiii._ on instagram

If you have questions or concerns about this Privacy Policy, please contact us at instagram page.

Your use of the App is subject to this Privacy Policy. Please read it carefully and review it periodically for updates.
""",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

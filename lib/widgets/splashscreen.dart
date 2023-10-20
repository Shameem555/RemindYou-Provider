
import 'package:flutter/material.dart';
import 'package:reminder/intro_page/bottomBar.dart';
import 'package:reminder/intro_page/first.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../main.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    checkUserLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 29, 29, 29),
        body: Center(
      child: Image.asset(
        'assets/daily notification.gif',
        height: 300,
      ),
    ));
  }
  
  Future<void> gotoLogin() async {
   await Future.delayed(
      const Duration(seconds: 3),
    );
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (ctx) => const FirstScreen()),
    );
  }

  Future<void> checkUserLoggedIn() async {
    final sharedpref = await SharedPreferences.getInstance();
    final userLoggedIn = sharedpref.getBool(saveKeyName);
    if (userLoggedIn == null || userLoggedIn == false) {
      gotoLogin();
    } else {
      // ignore: use_build_context_synchronously
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) => const BottomBar()));
    }
  }
}

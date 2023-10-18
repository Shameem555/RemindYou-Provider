import 'package:flutter/material.dart';
import 'package:reminder/intro_page/bottomBar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
    _navigate();
  } 

  _navigate() async{
    await Future.delayed(const Duration(seconds: 5),(){});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const BottomBar()));
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromARGB(221, 35, 30, 30),
      body: Center(
        child: Image.asset("assets/daily notification.gif",height: 300,width: double.infinity,),
      ),
    );
  }
  @override
  void dispose(){
    super.dispose();
  }
}
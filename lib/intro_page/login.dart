import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          child:  Column(
            children: [
              SizedBox(height: 100,),
              Center(
                child: SizedBox(
                  height: 300,width: 300,
                  child: Image.asset("assets/login_profile.jpeg"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
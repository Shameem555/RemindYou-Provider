import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

    final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final sheight = MediaQuery.of(context).size.height;
    final swidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: sheight,
          child:  Column(
            children: [
              const SizedBox(height: 100,),
              Center(
                child: SizedBox(
                  height: 300,width: 300,
                  child: Image.asset("assets/login_profile.jpeg",fit: BoxFit.fill,),
                ),
              ),
              Form(
                key: _formKey,
                child: SizedBox(
                  height: sheight,
                  width: swidth,
                  child: TextFormField(),
                )),
            ],
          ),
        ),
      ),
    );
  }
}
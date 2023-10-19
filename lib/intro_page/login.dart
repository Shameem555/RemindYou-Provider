import 'package:flutter/material.dart';

final _usernameController = TextEditingController();

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
                  child: TextFormField(
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: "UserName"
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Required Name";
                      }else{
                        return null;
                      }
                    },
                  ),
                ),
                ),
                Padding(padding: const EdgeInsets.only(top: 15),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blueAccent,
                  ),
                  width: swidth,
                  height: sheight,
                  child: const Text("Save",style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'f',color: Colors.white,fontSize: 17),),
                ),
                ),
            ],
          ),
        ),
      ),
    );
  }
   void loginCheck(BuildContext ctx) async {
    final username = _usernameController.text;
   }
}
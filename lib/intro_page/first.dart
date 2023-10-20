import 'package:flutter/material.dart';
import 'package:reminder/intro_page/login.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final Size size = MediaQuery.of(context).size;
    return  SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
               SizedBox(
                height: 400,
                width: 400,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20,left: 20),
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/istockphoto-503324704-612x612.jpg')), 
                      //color: Colors.amberAccent 
                    ),
                    child:   const Padding(
                      padding: EdgeInsets.only(top: 150,left: 130),
                      child: Text('Hi Boss! \n \n \n We Will help \n You to \n Remind your  \n Special Events..!',style: TextStyle(color: Colors.blueGrey,fontWeight: FontWeight.w600,),textAlign: TextAlign.left,),
                    ),
                  ),
                ),
               ),
               const SizedBox(height: 30,),
               const Text('"#Never Forget Again!! \n \n Get Started Now, \n \n Start Reminding"',textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.brown)),
                Padding(padding: const EdgeInsets.only(top: 80,left: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Login()));
                  },
                  child: Container(height: 70,width: 200,decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30),),color: Colors.blue,),child: const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text('Start',textAlign: TextAlign.center,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,),),
                  ),),
                ),),
            ],
          ),
        ),
      ));
  }
}
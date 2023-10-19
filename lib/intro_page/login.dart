// import 'package:flutter/material.dart';
// import 'package:reminder/intro_page/bottomBar.dart';
// import 'package:reminder/main.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// final _usernameController = TextEditingController();

// class Login extends StatefulWidget {
//   const Login({super.key});

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     final sheight = MediaQuery.of(context).size.height;
//     final swidth = MediaQuery.of(context).size.width;

//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 151, 155, 157),
//       body: SingleChildScrollView(
//         child: Container(
//           height: sheight,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const SizedBox(height: 1),
//               Center(
//                 child: SizedBox(
//                   height: 300,
//                   width: 300,
//                   child: Image.asset("assets/login_profile.jpeg", fit: BoxFit.fill),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               Form(
//                 key: _formKey,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 40),
//                   child: Column(
//                     children: [
//                       TextFormField(
//                         controller: _usernameController,
//                         decoration: InputDecoration(
//                           isDense: true,
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                           hintText: "UserName",
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return "Required Name";
//                           } else {
//                             return null;
//                           }
//                         },
//                       ),
//                       const SizedBox(height: 20),
//                       ElevatedButton(
//                         onPressed: () {
//                           if (_formKey.currentState!.validate()) {
//                             loginCheck(context);
//                           }
//                         },
//                         style: ElevatedButton.styleFrom(
//                           primary: Colors.blueAccent,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20),
//                           ),
//                         ),
//                         child: const Text(
//                           "Save",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontFamily: 'f',
//                             color: Colors.white,
//                             fontSize: 20,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void loginCheck(BuildContext ctx) async {
//     final username = _usernameController.text;

//     final sharedPref = await SharedPreferences.getInstance();
//     await sharedPref.setBool(saveKeyName, true);
//     await sharedPref.setString("username", username);
//     Navigator.pushReplacement(ctx, MaterialPageRoute(builder: (ctx) => const BottomBar()));
//   }
// }



import 'package:flutter/material.dart';
import 'package:reminder/intro_page/bottomBar.dart';
import 'package:reminder/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    final Size size = MediaQuery.of(context).size;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      //backgroundColor: const Color.fromARGB(255, 157, 151, 151),
      body: SingleChildScrollView(
        // ignore: sized_box_for_whitespace
        child: Container(
          height: screenHeight,
          child: Column(
            children: [
              const SizedBox(height: 100),
              Center(
                  child: SizedBox(
                height: 300,
                width: 300,
                child: Image.asset(
                  'assets/empty_profile.jpeg',
                  fit: BoxFit.fill,
                ),
              ),
              ),
              const SizedBox(height: 30,),
              Form(
                key: _formKey,
                child: SizedBox(
                  width: screenWidth * .8,
                  height: screenHeight * .08,
                  child: TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: 'Username',
                        ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Your Name Please!!';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      checkLogin(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const BottomBar()),
                      );
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color:  Colors.blue,
                    ),
                    width: size.width * 0.3,
                    height: size.height * 0.06,
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        fontFamily: 'f',
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void checkLogin(BuildContext ctx) async {
    final username = _usernameController.text;  

    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.setBool(saveKeyName, true);
    await sharedPref.setString('username', username);
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        ctx, MaterialPageRoute(builder: (ctx1) => const BottomBar()));
  }
}

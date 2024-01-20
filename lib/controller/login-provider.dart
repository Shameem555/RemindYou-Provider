import 'package:flutter/material.dart';
import 'package:reminder/intro_page/bottomBar.dart';
import 'package:reminder/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier{
  final usernameController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  

    void checkLogin(BuildContext ctx) async {
    final username = usernameController.text;  

    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.setBool(saveKeyName, true);
    await sharedPref.setString('username', username);

    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        ctx, MaterialPageRoute(builder: (ctx1) => const BottomBar()));

        notifyListeners();
  }
}
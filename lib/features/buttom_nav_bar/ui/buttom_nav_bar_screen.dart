import 'package:books_app/features/auth/ui/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ButtomNavBarScreen extends StatelessWidget {
  const ButtomNavBarScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [IconButton(onPressed: () async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove("token");
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ), (e)=>false);


    }
        , icon: Icon(Icons.login))],),);
  }
}

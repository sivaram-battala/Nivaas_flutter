import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nivaas/app/screens/bottomnav/bottomnav.dart';
import 'package:nivaas/app/screens/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  String token = '';

  timer() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('auth_token');

    Timer(Duration(seconds: 2), () {
      if (token != null || token != '') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Bottomnav()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        );
      }
    });
  }

  @override
  void initState() {
    timer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/Nivaas-logo.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

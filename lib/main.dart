import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nivaas/app/screens/sliders.dart';
import 'package:nivaas/app/screens/splashScreen/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ));
    return const MaterialApp(
      title: 'Counter App',
      home: Splashscreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
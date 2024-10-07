import 'package:flutter/material.dart';
class AppWidget{
  static  TextStyle boldTextFieldStyle(){
    return const TextStyle(
                    color: Color.fromARGB(255, 12, 11, 11),
                    fontSize: 22,
                    fontWeight: FontWeight.bold);
  }

  static TextStyle LightTextFieldStyle(){
    return const TextStyle(
      color: Color.fromARGB(255, 66, 64, 64),
      fontSize: 15.0,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle semiBoldTextFieldStyle(){
    return const TextStyle(
      color: Color.fromARGB(255, 22, 21, 21),
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle HeadlineTextFieldStyle(){
    return const TextStyle(
      color: Color.fromARGB(255, 18, 17, 17),
      fontSize: 22.0,
      fontWeight: FontWeight.bold,
    );
  }
}
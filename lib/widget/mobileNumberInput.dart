import 'package:flutter/material.dart';

class MobileNumberInput extends StatelessWidget {
  final TextEditingController number;

  MobileNumberInput({required this.number}); // Constructor accepting number

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: number,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: 'Enter your mobile number',
        border: OutlineInputBorder(),
      ),
    );
  }
}

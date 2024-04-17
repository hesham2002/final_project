import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
        required this.hintText,
        this.onChanged,
        required this.hiddenText,this.keyboardType});

  String hintText;
  bool hiddenText = false;
  TextInputType? keyboardType;
  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      obscureText: hiddenText,
      onChanged: onChanged,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelStyle: const TextStyle(color: Colors.black),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

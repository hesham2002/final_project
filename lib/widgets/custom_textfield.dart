import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
        required this.hintText,
        this.onChanged,
        required this.hiddenText,this.keyboardType,this.validator,this.controller,this.onTapOutside});

  String hintText;
  bool hiddenText = false;
  TextInputType? keyboardType;
  Function(String)? onChanged;
  String? Function(String?)? validator;
  TextEditingController? controller;
  void Function(PointerDownEvent)? onTapOutside;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: onTapOutside,
      controller: controller,
      validator: validator,
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

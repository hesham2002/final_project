import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
        required this.hintText,this.labelText,
        this.onChanged,
        required this.hiddenText,this.keyboardType,this.validator,this.controller,this.onTapOutside});
  String? labelText;
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
        labelText: labelText,
        filled: true,
        fillColor: Colors.white,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.black),
        hintText: hintText,
        hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

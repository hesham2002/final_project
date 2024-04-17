import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.buttonName, required this.onTap});
  VoidCallback? onTap;
  final String buttonName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        decoration: const BoxDecoration(

          color: Colors.white12,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        height: 60,
        width: double.infinity,
        child: Center(
            child: Text(
              buttonName,
              style: const TextStyle(fontSize: 25, color: Colors.white),
            )),
      ),
    );
  }
}

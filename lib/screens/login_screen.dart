import 'package:doclink_project/screens/register_screen.dart';
import 'package:doclink_project/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff020310),
                Color(0xff0A2538),
                Color(0xff134261),
                Color(0xff285171),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.1),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: screenWidth * 0.06,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              CustomTextField(hintText: 'email', hiddenText: false),
              SizedBox(height: screenHeight * 0.02),
              CustomTextField(hintText: 'password', hiddenText: true),
              SizedBox(height: screenHeight * 0.04),
              CustomButton(buttonName: 'Log In', onTap: () {}),
              SizedBox(height: screenHeight * 0.04),
              Divider(
                color: Colors.white,
                thickness: 0,
                indent: screenWidth * 0.04,
                endIndent: screenWidth * 0.04,
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Color(0xffC7EDE6),
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

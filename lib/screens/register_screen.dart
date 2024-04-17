import 'package:doclink_project/screens/login_screen.dart';
import 'package:doclink_project/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _generateId = false;
  String _selectedStatus = 'Doctor';

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
                  'Sign Up',
                  style: TextStyle(
                    fontSize: screenWidth * 0.06,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
              CustomTextField(hintText: 'username', hiddenText: false),
              SizedBox(height: screenHeight * 0.02),
              CustomTextField(hintText: 'email', hiddenText: false),
              SizedBox(height: screenHeight * 0.02),
              CustomTextField(hintText: 'password', hiddenText: true),
              SizedBox(height: screenHeight * 0.02),
              Row(
                children: [
                  Checkbox(

                    value: _generateId,
                    onChanged: (value) {
                      setState(() {
                        _generateId = value!;
                      });
                    },
                  ),
                  Text(
                    'Generate ID Automatically',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Select Status:',
                  style: TextStyle(color: Colors.white,fontSize: 18),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio(activeColor: Colors.white,
                    value: 'Doctor',
                    groupValue: _selectedStatus,
                    onChanged: (value) {
                      setState(() {
                        _selectedStatus = value!;
                      });
                    },
                  ),
                  Text(
                    'Doctor',
                    style: TextStyle(color: Colors.white),
                  ),
                  Radio(
                    value: 'Receptionist',
                    activeColor: Colors.white,
                    groupValue: _selectedStatus,
                    onChanged: (value) {
                      setState(() {
                        _selectedStatus = value!;
                      });
                    },
                  ),
                  Text(
                    'Receptionist',
                    style: TextStyle(color: Colors.white),
                  ),
                  Radio(
                    value: "Doctor's Assistant",
                    activeColor: Colors.white,
                    groupValue: _selectedStatus,
                    onChanged: (value) {
                      setState(() {
                        _selectedStatus = value!;
                      });
                    },
                  ),
                  Text(
                    "Doctor's Assistant",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.04),
              CustomButton(buttonName: 'Sign Up', onTap: () {}),
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
                    'Already have an account?',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Log In',
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

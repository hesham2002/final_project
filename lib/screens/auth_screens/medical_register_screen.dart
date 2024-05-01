import 'package:doclink_project/screens/auth_screens/medical_login_screen.dart';
import 'package:doclink_project/screens/auth_screens/patient_register_screen.dart';
import 'package:doclink_project/screens/search_screen.dart';
import 'package:doclink_project/widgets/custom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../widgets/custom_button.dart';

class MedicalRegisterScreen extends StatefulWidget {
  @override
  _MedicalRegisterScreenState createState() => _MedicalRegisterScreenState();
}

class _MedicalRegisterScreenState extends State<MedicalRegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nationalIdController = TextEditingController();
  final TextEditingController _jobIdController = TextEditingController();

  String? username;
  String? nationalId;
  String? jobId;
  String _selectedStatus = 'Doctor';
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView(
            children: [
              SizedBox(height: screenHeight * 0.2),
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
              CustomTextField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
                controller: _usernameController,
                hintText: 'Username',
                hiddenText: false,
                onChanged: (data) {
                  username = data;
                },
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
              ),
              SizedBox(height: screenHeight * 0.02),
              CustomTextField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your national ID';
                  }
                  return null;
                },
                controller: _nationalIdController,
                hintText: 'National ID',
                hiddenText: false,
                onChanged: (data) {
                  nationalId = data;
                },
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
              ),
              SizedBox(height: screenHeight * 0.02),
              CustomTextField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your job ID';
                  }
                  return null;
                },
                controller: _jobIdController,
                hintText: 'Job ID',
                hiddenText: false,
                onChanged: (data) {
                  jobId = data;
                },
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
              ),

              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Select Status:',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio(
                    activeColor: Colors.white,
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

              CustomButton(
                buttonName: 'Sign up',
                onTap: () {},
              ),
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
                    'already have an account?',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MedicalLoginScreen(),
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

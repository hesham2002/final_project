import 'package:doclink_project/screens/auth_screens/medical_register_screen.dart';
import 'package:doclink_project/screens/auth_screens/patient_register_screen.dart';
import 'package:doclink_project/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';

class MedicalLoginScreen extends StatefulWidget {
  @override
  _DoctorLoginScreenState createState() => _DoctorLoginScreenState();
}

class _DoctorLoginScreenState extends State<MedicalLoginScreen> {
  final TextEditingController _nationalIdController = TextEditingController();
  final TextEditingController _jobIdController = TextEditingController();

  String? username;
  String? nationalId;
  String? jobId;

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

              CustomButton(
                buttonName: 'Log In',
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
                    'Don\'t have an account?',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(width: screenWidth * 0.03),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MedicalRegisterScreen(),
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

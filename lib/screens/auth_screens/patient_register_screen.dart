import 'package:doclink_project/screens/auth_screens/medical_login_screen.dart';
import 'package:doclink_project/screens/auth_screens/patient_login_screen.dart';
import 'package:doclink_project/widgets/custom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../widgets/custom_button.dart';

class PatientRegisterScreen extends StatefulWidget {
  @override
  _PatientRegisterScreenState createState() => _PatientRegisterScreenState();
}

class _PatientRegisterScreenState extends State<PatientRegisterScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool isLoading = false;
  String? userName;
  String? email;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
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
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView(

                children: [
                  SizedBox(height: screenHeight * 0.2),
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: screenWidth * 0.08,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  CustomTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                    hintText: 'Username',
                    hiddenText: false,
                    onChanged: (data) {
                      userName = data;
                    },
                    controller: _usernameController,
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    hintText: 'Email',
                    hiddenText: false,
                    onChanged: (data) {
                      email = data;
                    },
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    controller: _emailController,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    hintText: 'Password',
                    hiddenText: true,
                    onChanged: (data) {
                      password = data;
                    },
                    controller: _passwordController,
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  CustomButton(
                    buttonName: 'Sign Up',
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                        try {
                          UserCredential userCredential = await FirebaseAuth
                              .instance
                              .createUserWithEmailAndPassword(
                            email: email!,
                            password: password!,
                          );

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Registration successful'),
                            ),
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MedicalLoginScreen(),
                            ),
                          );
                        } on FirebaseAuthException catch (e) {
                          String errorMessage = 'An error occurred';
                          if (e.code == 'weak-password') {
                            errorMessage = 'The password provided is too weak';
                          } else if (e.code == 'email-already-in-use') {
                            errorMessage = 'The account already exists for that email';
                          }
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(errorMessage)),
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Incorrect data: $e')),
                          );
                        } finally {
                          setState(() {
                            isLoading = false;
                          });
                        }
                      }
                    },
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(width: screenWidth * 0.02),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PatientLoginScreen(),
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
        ),
      ),
    );
  }
}

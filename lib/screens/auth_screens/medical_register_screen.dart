import 'package:doclink_project/models/medical_user_model.dart';
import 'package:doclink_project/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';
import 'medical_login_screen.dart';

class MedicalRegisterScreen extends StatefulWidget {
  @override
  _MedicalRegisterScreenState createState() => _MedicalRegisterScreenState();
}

class _MedicalRegisterScreenState extends State<MedicalRegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _nationalIdController = TextEditingController();
  final TextEditingController _jobIdController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  String? username;
  String? nationalId;
  String? jobId;
  String? email;
  String? password;
  String _selectedStatus = 'Doctor';
  bool isLoading = false;

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
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Create an Account',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  CustomTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    controller: _emailController,
                    hintText: 'Email',
                    hiddenText: false,
                    onChanged: (data) {
                      email = data;
                    },
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  CustomTextField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    controller: _passwordController,
                    hintText: 'Password',
                    hiddenText: true,
                    onChanged: (data) {
                      password = data;
                    },
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  ),
                  SizedBox(height: screenHeight * 0.02),
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
                      if (value.length != 14 || int.tryParse(value) == null) {
                        return 'National ID should consist of 14 numbers';
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
                      if (value.length != 8 || int.tryParse(value) == null) {
                        return 'Job ID should consist of 8 numbers';
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
                          if (userCredential.user != null) {
                            MedicalUser medicalUser = MedicalUser(
                              username: username,
                              nationalId: nationalId,
                              jobId: jobId,
                              email: email,
                              status: _selectedStatus,
                            );
                            await AuthService().saveUserData(medicalUser);
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
                          }
                        } on FirebaseAuthException catch (e) {
                          String errorMessage = 'An error occurred';
                          if (e.code == 'weak-password') {
                            errorMessage = 'The password provided is too weak';
                          } else if (e.code == 'email-already-in-use') {
                            errorMessage =
                                'The account already exists for that email';
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

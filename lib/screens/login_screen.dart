import 'package:doclink_project/screens/register_screen.dart';
import 'package:doclink_project/views/hospital_screen.dart';
import 'package:doclink_project/widgets/custom_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
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
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  controller: _emailController,
                  hintText: 'email',
                  hiddenText: false,
                  onChanged: (data) {
                    email = data;
                  },
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                ),
                SizedBox(height: screenHeight * 0.02),
                CustomTextField(
                  controller: _passwordController,
                  hintText: 'password',
                  hiddenText: true,
                  onChanged: (data) {
                    password = data;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                ),
                SizedBox(height: screenHeight * 0.04),



              CustomButton(
                buttonName: 'Log In',
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    setState(() {
                      isLoading = true;
                    });

                    try {
                      UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: email!,
                        password: password!,
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Login successful'),
                        ),
                      );

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HospitalHomePage(),
                        ),
                      );
                    } on FirebaseAuthException catch (e) {
                      String errorMessage;
                      if (e.code == 'user-not-found') {
                        errorMessage = 'No user found for that email';
                      } else if (e.code == 'wrong-password') {
                        errorMessage = 'Wrong password provided for that user';
                      } else {
                        errorMessage = 'Error: ${e.message}';
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(errorMessage),
                        ),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Error: $e'),
                        ),
                      );
                    }

                    setState(() {
                      isLoading = false;
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please insert correct data'),
                      ),
                    );
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
      ),
    );
  }
}

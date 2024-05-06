import 'package:doclink_project/screens/auth_screens/medical_login_screen.dart';
import 'package:doclink_project/screens/auth_screens/patient_login_screen.dart';
import 'package:doclink_project/widgets/animated_card.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  bool firstCardFocused = false;
  bool secondCardFocused = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF191C29),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              child: const Animated3DCard(
                coverImage: 'assets/patient.jpeg',
                title: 'patients',
                child: Text("jj"),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PatientLoginScreen(),
                  ),
                );
              },
              //  child:Text("nn"),
            ),
            // ),
            const SizedBox(height: 20), // Add some space between the cards

            InkWell(
              child: const Animated3DCard(
                coverImage: 'assets/medical_staff.jpeg',
                title: 'medical staff',
                child: null,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MedicalLoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

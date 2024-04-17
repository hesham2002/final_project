import 'package:doclink_project/widgets/animated_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            Animated3DCard(
              coverImage: 'assets/patient.jpeg',
              title: 'patients',
            ),
            SizedBox(height: 20), // Add some space between the cards
            Animated3DCard(
              coverImage: 'assets/medical_staff.jpeg',
              title: 'medical staff',
            ),
          ],
        ),
      ),
    );
  }
}

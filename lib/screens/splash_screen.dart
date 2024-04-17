import 'dart:async';

import 'package:doclink_project/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0.0, -0.5),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();

    // Navigate to home page after 3 seconds
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF191C29),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideTransition(
              position: _offsetAnimation,
              child: Image.asset(
                'assets/appIcon.png', // Replace 'assets/logo.png' with your image asset
                width: 200,
                height: 200,
              ),
            ),
            SizedBox(height: 20),
            AnimatedDefaultTextStyle(
              duration: Duration(seconds: 3),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              child: Text('DocLink',style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}


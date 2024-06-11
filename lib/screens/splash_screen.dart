import 'dart:async';
import 'package:doclink_project/screens/intro_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
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

    // Navigate to home page after 5 seconds
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => IntroScreen()),
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
            SequentialFlashingText(
              text: 'DocLink',
              duration: Duration(milliseconds: 1000), // Duration for the whole sequence
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

class SequentialFlashingText extends StatefulWidget {
  final String text;
  final Duration duration;

  const SequentialFlashingText({
    required this.text,
    required this.duration,
    Key? key,
  }) : super(key: key);

  @override
  _SequentialFlashingTextState createState() => _SequentialFlashingTextState();
}

class _SequentialFlashingTextState extends State<SequentialFlashingText> {
  late List<bool> _visible;
  late Timer _timer;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _visible = List.generate(widget.text.length, (index) => false);

    _timer = Timer.periodic(Duration(milliseconds: widget.duration.inMilliseconds ~/ widget.text.length), (timer) {
      setState(() {
        if (_currentIndex < widget.text.length) {
          _visible[_currentIndex] = true;
          _currentIndex++;
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < widget.text.length; i++)
          AnimatedOpacity(
            opacity: _visible[i] ? 1.0 : 0.0,
            duration: Duration(milliseconds: 300),
            child: Text(
              widget.text[i],
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
      ],
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

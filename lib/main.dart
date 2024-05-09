import 'package:doclink_project/screens/auth_screens/patient_register_screen.dart';
import 'package:doclink_project/screens/chat_part/chat_screen.dart';
import 'package:doclink_project/screens/intro_screen.dart';
import 'package:doclink_project/screens/search_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'screens/hospital_part/hospital_screen.dart';
import 'screens/profilePatien.dart';
import 'screens/transform_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primaryColor: Color.fromARGB(255, 24, 24, 100),
        // Colors.blue.shade300,
        dividerColor: Colors.black,
      ),
      home: ProfilePage(),
      routes: {
        "HospitalHomePage": (context) => HospitalHomePage(),
        "ChatScreen": (context) => ChatScreen(),
        "EntryScreen": (context) => IntroScreen(),
        "RegisterScreen": (context) => PatientRegisterScreen(),
        "TransformScreen": (context) => TransformScreen(),
        "SearchScreen": (context) => SearchScreen(),
        "SplashScreen": (context) => ProfilePage(),
      },
    );
  }
}

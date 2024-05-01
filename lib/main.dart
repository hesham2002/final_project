import 'package:doclink_project/screens/auth_screens/patient_login_screen.dart';
import 'package:doclink_project/screens/chat_screen.dart';
import 'package:doclink_project/screens/intro_screen.dart';
import 'package:doclink_project/screens/auth_screens/medical_login_screen.dart';
import 'package:doclink_project/screens/profile_screen.dart';
import 'package:doclink_project/screens/auth_screens/patient_register_screen.dart';
import 'package:doclink_project/screens/search_screen.dart';
import 'package:doclink_project/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'views/doctors_section_screen.dart';
import 'views/hospital_screen.dart';
import 'views/schedule_screen.dart';

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
      theme: ThemeData(useMaterial3: false),
      home: SplashScreen(),
      // initialRoute: 'HospitalHomePage',
      // initialRoute: 'SplashScreen',
      routes: {
        // '/details': (context) => DetailsPage(),
        "HospitalHomePage": (context) => HospitalHomePage(),
        "ScheduleScreen": (context) => ScheduleScreen(),
        "AppointmentScreen": (context) => DoctorSection(),
        "ChatScreen": (context) => ChatScreen(),
        "EntryScreen": (context) => IntroScreen(),
        "LoginScreen": (context) => MedicalLoginScreen(),
        "ProfileScreen": (context) => ProfileScreen(),
        "RegisterScreen": (context) => PatientRegisterScreen(),
        "SearchScreen": (context) => Search_screen(),
        "SplashScreen": (context) => SplashScreen(),
      },
    );
  }
}

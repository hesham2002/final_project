import 'package:doclink_project/screens/chat_screen.dart';
import 'package:doclink_project/screens/home_screen.dart';
import 'package:doclink_project/screens/login_screen.dart';
import 'package:doclink_project/screens/profile_screen.dart';
import 'package:doclink_project/screens/register_screen.dart';
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

      // initialRoute: 'HospitalHomePage',
      initialRoute: 'SplashScreen',
      routes: {
        // '/details': (context) => DetailsPage(),
        "HospitalHomePage": (context) => HospitalHomePage(),
        "ScheduleScreen": (context) => ScheduleScreen(),
        "AppointmentScreen": (context) => DectorSection(),
        "ChatScreen": (context) => ChatScreen(),
        "EntryScreen": (context) => EntryScreen(),
        "LoginScreen": (context) => LoginScreen(),
        "ProfileScreen": (context) => ProfileScreen(),
        "RegisterScreen": (context) => RegisterScreen(),
        "SearchScreen": (context) => Search_screen(),
        "SplashScreen": (context) => SplashScreen(),
      },
    );
  }
}

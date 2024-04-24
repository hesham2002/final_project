import 'package:doclink_project/screens/chat_screen.dart';
import 'package:doclink_project/screens/home_screen.dart';
import 'package:doclink_project/screens/login_screen.dart';
import 'package:doclink_project/screens/profile_screen.dart';
import 'package:doclink_project/screens/register_screen.dart';
import 'package:doclink_project/screens/search_screen.dart';
import 'package:doclink_project/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'views/dectors_section.dart';
import 'views/home.dart';
import 'views/schadualepage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  debugPrintRebuildDirtyWidgets = true;
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
      initialRoute: 'HospitalHomePage',
      routes: {
        // '/details': (context) => DetailsPage(),
        "HospitalHomePage": (context) => HospitalHomePage(),
        "SchadualerPage": (context) => SchadualerPage(),
        "AppiontmentPage": (context) => DectorSection(),
        //
        "ChatScreen": (context) => ChatScreen(),
        "HomeScreen": (context) => HomeScreen(),
        "LoginScreen": (context) => LoginScreen(),
        "ProfileScreen": (context) => ProfileScreen(),
        "RegisterScreen": (context) => RegisterScreen(),
        "Search_screen": (context) => Search_screen(),
        "SplashScreen": (context) => SplashScreen(),
      },
    );
  }
}

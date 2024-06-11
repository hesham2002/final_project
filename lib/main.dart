import 'package:doclink_project/screens/assistant_profile.dart';
import 'package:doclink_project/screens/auth_screens/medical_login_screen.dart';
import 'package:doclink_project/screens/auth_screens/medical_register_screen.dart';
import 'package:doclink_project/screens/auth_screens/patient_login_screen.dart';
import 'package:doclink_project/screens/auth_screens/patient_register_screen.dart';
import 'package:doclink_project/screens/chat_part/chat_screen.dart';
import 'package:doclink_project/screens/doctor_part/appointment_screen.dart';
import 'package:doclink_project/screens/doctor_part/doctor_profile_screen.dart';
import 'package:doclink_project/screens/hospital_part/hospital_screen.dart';
import 'package:doclink_project/screens/intro_screen.dart';
import 'package:doclink_project/screens/receive_screen.dart';
import 'package:doclink_project/screens/search_part/medical_search_screen.dart';
import 'package:doclink_project/screens/splash_screen.dart';
import 'package:doclink_project/screens/transform_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'helper/assistant_provider.dart';
import 'screens/patient_profile_screen.dart';


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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AssistantProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: false),
        home: MedicalLoginScreen(),

      ),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_one/screens/home_screen.dart';
import 'package:project_one/screens/login_screen.dart';
import 'package:project_one/screens/splash_screen.dart';
import 'package:project_one/utils/bottom_nav.dart';

import 'firebase_options.dart';

void main() async {
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
      title: 'Flutter Demo',
      theme: ThemeData(
        // scaffoldBackgroundColor: Colors.white54,
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}

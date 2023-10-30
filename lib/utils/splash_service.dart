import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_one/screens/login_screen.dart';

class SplashService {
  void isLogin(BuildContext context) {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
    });
  }
}

import 'package:flutter/material.dart';
import 'splash.dart';
import 'Auth/login.dart';
import 'Auth/signup.dart';

void main() {
  runApp(const TruckNavApp());
}

class TruckNavApp extends StatelessWidget {
  const TruckNavApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TruckNav App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
       },
    );
  }
}

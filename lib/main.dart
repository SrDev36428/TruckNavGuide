import 'package:flutter/material.dart';
import 'splash.dart';
import 'Auth/login.dart';

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
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'splash.dart';
import 'Auth/login.dart';
import 'Auth/signup.dart';
import 'profiles/truckProfile.dart';
import 'subscription/trial.dart';
import 'subscription/subscription.dart';
import 'setting.dart';

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
        '/truck_profile': (context) => const TruckProfileScreen(),
        '/free_trial': (context) => const FreeTrialScreen(),
        '/subscribe': (context) => const SubscriptionScreen(),
        '/setting': (context) => const SettingsPage()
      },
    );
  }
}

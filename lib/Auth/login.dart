import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import "package:trucknav/components/gradientButton.dart";
import 'package:trucknav/components/labeledTextField.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginScreen(),
  ));
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 100.0, left: 30.0, right: 30.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: SvgPicture.asset(
                    'assets/img/no_letter.svg',
                    width: 100,
                  ),
                ),
                const Center(
                  child: Text(
                    'Welcome Back',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F2937),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                const Center(
                  child: Text(
                    'Sign in to continue your journey',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                LabeledTextField(
                  label: 'Email',
                  hintText: 'Enter your email',
                  controller: emailController,
                ),
                const SizedBox(height: 16),
                LabeledTextField(
                  label: 'Password',
                  hintText: 'Enter your password',
                  controller: passwordController,
                  obscureText: true,
                ),
                const SizedBox(height: 24),

                GradientButton(
                  text: 'Sign In',
                  onPressed: () {
                    // Your login logic here
                  },
                ),
                const SizedBox(height: 16),

                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: const TextStyle(
                        color: Colors.black, // Default color
                        fontSize: 18,
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          style: const TextStyle(
                            color: Color(0xFF2c5aa0),
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // TODO: Navigate to Sign Up
                              print('Sign Up tapped');
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}


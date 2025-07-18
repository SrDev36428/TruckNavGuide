import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import "package:trucknav/components/gradientButton.dart";
import 'package:trucknav/components/labeledTextField.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SignupScreen(),
  ));
}

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fullNameController = TextEditingController();
    final companyNameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Center(
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
                    'Create Account',
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
                    'Join thousands of professional drivers',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                LabeledTextField(
                  label: 'Full Name',
                  hintText: 'Enter your full name',
                  controller: fullNameController,
                ),
                const SizedBox(height: 16),
                LabeledTextField(
                  label: 'Email',
                  hintText: 'Enter your email',
                  controller: emailController,
                ),
                const SizedBox(height: 16),
                LabeledTextField(
                  label: 'Company Name',
                  hintText: 'Enter your company name',
                  controller: companyNameController,
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
                  text: 'Create Account',
                  onPressed: () {
                    // Your login logic here
                  },
                ),
                const SizedBox(height: 16),

                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: const TextStyle(
                        color: Colors.black, // Default color
                        fontSize: 18,
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign In',
                          style: const TextStyle(
                              color: Color(0xFF2c5aa0),
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(context, '/login');
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
      ),
    );
  }
}


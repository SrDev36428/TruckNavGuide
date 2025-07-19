import 'package:flutter/material.dart';
import 'package:trucknav/components/freeTrailBanner.dart'; // Adjust path as needed
import 'package:trucknav/components/subscriptionOption.dart'; // Adjust path as needed

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pushNamed(context, '/setting'),
        ),
        title: const Text(
          'Subscription',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(36),
          color: Colors.white,
          child: Column(
            children: [
              FreeTrialBanner(
                daysRemaining: 8,
                progressPercent: 0.4,
              ),
              const SizedBox(height: 24),
              SubscriptionOption(
                title: 'Monthly',
                price: '\$19.99',
                period: '/month',
                features: [
                  'Unlimited navigation',
                  'Real-time alerts',
                  'Live traffic updates',
                  'Priority support',
                ],
                buttonText: 'Choose Monthly',
                onPressed: () {},
              ),
              const SizedBox(height: 16),
              SubscriptionOption(
                title: 'Annual',
                price: '\$199.99',
                period: '/year',
                features: [
                  'Unlimited navigation',
                  'Real-time alerts',
                  'Live traffic updates',
                  'Priority support',
                  'Advanced route optimization', // ✅ Added this feature
                ],
                buttonText: 'Choose Annual',
                onPressed: () {},
                isMostPopular: true,
                savingsText: 'Save \$39.89',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

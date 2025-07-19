import 'package:flutter/material.dart';

class FreeTrialBanner extends StatelessWidget {
  final int daysRemaining;
  final double progressPercent;

  const FreeTrialBanner({
    super.key,
    required this.daysRemaining,
    required this.progressPercent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF10b981), // #10b981
            Color(0xFF059669), // #059669
          ],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Free Trial',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '$daysRemaining days remaining',
            style: const TextStyle(
                color: Color(0xCCFFFFFF),
                fontSize: 14,
                fontWeight: FontWeight.w600
            ),
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: progressPercent,
              backgroundColor: Colors.white24,
              valueColor: AlwaysStoppedAnimation<Color>(
                daysRemaining > 7
                    ? Colors.white
                    : (daysRemaining > 3 ? Colors.orange : Colors.redAccent),
              ),
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }
}

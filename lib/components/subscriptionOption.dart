import 'package:flutter/material.dart';

class SubscriptionOption extends StatelessWidget {
  final String title;
  final String price;
  final String period;
  final List<String> features;
  final String buttonText;
  final VoidCallback onPressed;
  final bool isMostPopular;
  final String? savingsText;

  const SubscriptionOption({
    super.key,
    required this.title,
    required this.price,
    required this.period,
    required this.features,
    required this.buttonText,
    required this.onPressed,
    this.isMostPopular = false,
    this.savingsText,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          margin: isMostPopular ? const EdgeInsets.only(top: 12) : null,
          decoration: BoxDecoration(
            border: Border.all(
              color: isMostPopular ? Color(0xFF2c5aa0) : Color(0xFFe5e7eb),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isMostPopular) const SizedBox(height: 12),

              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2937),
                ),
              ),
              const SizedBox(height: 10),

              RichText(
                text: TextSpan(
                  text: price,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2c5aa0),
                  ),
                  children: [
                    TextSpan(
                      text: period,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF6b7280),
                      ),
                    ),
                  ],
                ),
              ),

              if (savingsText != null)
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    savingsText!,
                    style: const TextStyle(
                      color: Color(0xFF10b981),
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ),

              const SizedBox(height: 20),

              ...features.map(
                    (feature) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      const Icon(Icons.check, color: Color(0xFF10b981), size: 20),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Text(
                          feature,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.zero, // Remove default padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: Colors.transparent, // Important!
                    shadowColor: Colors.transparent,     // Optional: remove shadow if needed
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF2c5aa0), // #2c5aa0
                          Color(0xFF1e3a8a), // #1e3a8a
                        ],
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      alignment: Alignment.center,
                      child: Text(
                        buttonText,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        if (isMostPopular)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF3B82F6),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    )
                  ],
                ),
                child: const Text(
                  'Most Popular',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.4,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

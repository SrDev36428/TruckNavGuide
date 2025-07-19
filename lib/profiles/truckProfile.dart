import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TruckProfileScreen extends StatefulWidget {
  const TruckProfileScreen({super.key});

  @override
  State<TruckProfileScreen> createState() => _TruckProfileScreenState();
}

class _TruckProfileScreenState extends State<TruckProfileScreen> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController widthController = TextEditingController();
  final TextEditingController lengthController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  @override
  void dispose() {
    heightController.dispose();
    widthController.dispose();
    lengthController.dispose();
    weightController.dispose();
    super.dispose();
  }

  void _handleContinue() {
    final truckProfile = TruckProfile(
      height: double.tryParse(heightController.text) ?? 0.0,
      width: double.tryParse(widthController.text) ?? 0.0,
      length: double.tryParse(lengthController.text) ?? 0.0,
      weight: double.tryParse(weightController.text) ?? 0.0,
    );

    debugPrint('Truck Profile: $truckProfile');

    Navigator.pushNamed(context, '/subscribe');

    // Example: Navigate or submit data
    // Navigator.pushNamed(context, '/nextScreen', arguments: truckProfile);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Truck Profile',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Enter your truck dimensions for safe routing',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Icon(Icons.local_shipping, size: 80, color: Colors.blue.shade700),
              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(child: buildInputField('Height (m)', '4.3', heightController)),
                  const SizedBox(width: 10),
                  Expanded(child: buildInputField('Width (m)', '2.5', widthController)),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(child: buildInputField('Length (m)', '19.0', lengthController)),
                  const SizedBox(width: 10),
                  Expanded(child: buildInputField('Weight (t)','42.5', weightController)),
                ],
              ),
              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  border: Border.all(color: Colors.orange.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.warning, color: Colors.orange.shade700),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Text(
                        'Ensure dimensions are accurate. Incorrect information may lead to unsafe routing.',
                        style: TextStyle(fontSize: 13, color: Colors.black87),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.blue.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: _handleContinue,
                  child: const Text('Continue', style:
                  TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w700
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInputField(String label, String placeholder, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 14)),
        const SizedBox(height: 8.4),
        TextField(
          controller: controller,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
          ],
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 0.4), // customize opacity here
              fontSize: 14,
            ),
            // Default border
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFF9CA3AF), // Custom light grey color when not focused
                width: 1.5,
              ),
            ),

            // Focused border
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Color(0xFF2C5AA0), // Blueish color when focused
                width: 2.0,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
        ),
      ],
    );
  }
}

class TruckProfile {
  final double height;
  final double width;
  final double length;
  final double weight;

  TruckProfile({
    required this.height,
    required this.width,
    required this.length,
    required this.weight,
  });

  @override
  String toString() {
    return 'Height: $height m, Width: $width m, Length: $length m, Weight: $weight t';
  }
}


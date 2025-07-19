import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool showSpeedometer = true;
  bool cautionAlerts = true;
  bool pushNotifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        children: [
          // Display Section
          const Text(
            'Display',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 8),
          // Toggle with text NOT clickable
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Show Speedometer'),
              FlutterSwitch(
                value: showSpeedometer,
                onToggle: (val) => setState(() => showSpeedometer = val),
                width: 50,
                height: 24,
                toggleSize: 20,  // Size of the round toggle
                borderRadius: 20, // Roundness of track
                activeColor: Color(0xFF2c5aa0),
                inactiveColor: Colors.grey,
              )
            ],
          ),
          const SizedBox(height: 20),

          // Alerts Section
          const Text(
            'Alerts',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Caution Alerts'),
              FlutterSwitch(
                value: cautionAlerts,
                onToggle: (val) => setState(() => cautionAlerts = val),
                width: 50,
                height: 24,
                toggleSize: 20,  // Size of the round toggle
                borderRadius: 20, // Roundness of track
                activeColor: Color(0xFF2c5aa0),
                inactiveColor: Colors.grey,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Push Notifications'),
              FlutterSwitch(
                value: pushNotifications,
                onToggle: (val) => setState(() => pushNotifications = val),
                width: 50,
                height: 24,
                toggleSize: 20,  // Size of the round toggle
                borderRadius: 20, // Roundness of track
                activeColor: Color(0xFF2c5aa0),
                inactiveColor: Colors.grey,
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Truck Profile Section
          const Text(
            'Truck Profile',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 10),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(FontAwesomeIcons.truck),
            title: const Text('Edit Truck Dimensions'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushNamed(context, '/truck_profile');
            },
          ),
          const SizedBox(height: 20),

          // Account Section
          const Text(
            'Account',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(FontAwesomeIcons.solidCreditCard),
            title: const Text('Subscription'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.pushNamed(context, '/subscribe');
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.person_outline),
            title: const Text('Profile'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // Navigate to profile screen
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text(
              'Sign Out',
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}

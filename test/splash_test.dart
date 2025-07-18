import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trucknav/splash.dart'; // Update with your actual import path
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  testWidgets('SplashScreen displays logo and text', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SplashScreen(),
      ),
    );

    // Check SVG image loaded
    expect(find.byType(SvgPicture), findsOneWidget);

    // Check slogan text is present
    expect(find.text('Smart Navigation for Professional Drivers'), findsOneWidget);

    // Check progress indicator exists
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('SplashScreen navigates after 3 seconds', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        routes: {
          '/': (context) => const SplashScreen(),
          '/login': (context) => const Placeholder(), // Dummy login screen
        },
      ),
    );

    // Wait for 3 seconds
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle(); // finish any animations or frames

    // Check if we navigated to the placeholder login screen
    expect(find.byType(Placeholder), findsOneWidget);
  });
}

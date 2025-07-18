import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trucknav/Auth/login.dart'; // Update this if your path is different

void main() {
  testWidgets('LoginScreen has icon, inputs, and buttons', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: LoginScreen(),
      ),
    );

    // Check for the truck icon
    expect(find.byIcon(Icons.local_shipping), findsOneWidget);

    // Check for text fields
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.widgetWithText(TextField, 'Email'), findsOneWidget);
    expect(find.widgetWithText(TextField, 'Password'), findsOneWidget);

    // Check for the Sign In button
    expect(find.widgetWithText(ElevatedButton, 'Sign In'), findsOneWidget);

    // Check for the Sign Up text button
    expect(find.widgetWithText(TextButton, "Don't have an account? Sign Up"), findsOneWidget);
  });

  testWidgets('Typing in login fields works', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: LoginScreen(),
      ),
    );

    // Enter text in email and password
    await tester.enterText(find.byType(TextField).at(0), 'test@example.com');
    await tester.enterText(find.byType(TextField).at(1), 'mypassword');

    expect(find.text('test@example.com'), findsOneWidget);
    expect(find.text('mypassword'), findsOneWidget);
  });
}

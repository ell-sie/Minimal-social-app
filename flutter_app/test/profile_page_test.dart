import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/components/my_back_button.dart';

void main() {
  testWidgets('ProfilePage Widget Test', (WidgetTester tester) async {
    // Build a dummy ProfilePage widget
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            // back button
            const Padding(
              padding: EdgeInsets.only(
                top: 50.0,
                left: 25,
              ),
              child: Row(
                children: [
                  MyBackButton(),
                ],
              ),
            ),

            // profile pic
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(24),
              ),
              padding: const EdgeInsets.all(25),
              child: const Icon(
                Icons.person,
                size: 64,
              ),
            ),

            const SizedBox(height: 25),

            // username
            const Text(
              'Test User',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10,),
            // email
            Text(
              'testuser@example.com',
              style: TextStyle(
                color:Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    ));

    // Create the Finders
    final backButtonFinder = find.byType(MyBackButton);

    // Verify that the MyBackButton is in the widget tree
    expect(backButtonFinder, findsOneWidget);
  });
}

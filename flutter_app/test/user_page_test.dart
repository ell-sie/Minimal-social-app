import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/my_back_button.dart';

void main() {
  testWidgets('UserPage Widget Test', (WidgetTester tester) async {
    // Build a dummy widget
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 50.0,
                left: 25,
              ),
              child: Row(
                children: [
                  MyBackButton(
                    key: Key('backButton'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                padding: const EdgeInsets.all(0),
                itemBuilder: (context, index) {
                  return const ListTile(
                    title: Text('Test User'),
                    subtitle: Text('testuser@example.com'),
                  );
                },
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

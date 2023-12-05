import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/components/my_textfield.dart';
import 'package:flutter_app/components/my_post_button.dart';
import 'package:flutter_app/components/my_list_tile.dart';

void main() {
  testWidgets('HomePage Widget Test', (WidgetTester tester) async {
    // Build a dummy HomePage widget
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("W A L L"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.blue,
          elevation: 0,
        ),
        body: Column(
          children: [
            // Textfield box for user to type
            Padding(
              padding: const EdgeInsets.all(25),
              child: Row(
                children: [
                  // textfield
                  Expanded(
                    child: MyTextField(
                      controller: TextEditingController(),
                      key: const Key('textfield'),
                      hintText: "Say something", 
                      obscureText: false, 
                    ),
                  ),
                    
                  // post button
                  PostButton(
                    key: const Key('postbutton'),
                    onTap: () {},
                  )
                ],
              ),
            ),

            // posts
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  // return as a a list tile
                  return const MyListTile(
                    title: 'Test Message', 
                    subTitle: 'testuser@example.com',
                  );
                }),
            ),
          ],
        ),
      ),
    ));

    // Create the Finders
    final textFieldFinder = find.byType(MyTextField);
    final postButtonFinder = find.byType(PostButton);
    final listTileFinder = find.byType(MyListTile);

    // Verify that the MyTextField, PostButton, and MyListTile widgets are in the widget tree
    expect(textFieldFinder, findsOneWidget);
    expect(postButtonFinder, findsOneWidget);
    expect(listTileFinder, findsWidgets);
  });
}

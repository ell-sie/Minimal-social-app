import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/pages/register_page.dart';
import 'package:flutter_app/components/my_textfield.dart';
import 'package:flutter_app/components/my_button.dart';

void main() {
  testWidgets('RegisterPage Widget Test', (WidgetTester tester) async {
    // Build the RegisterPage widget
    await tester.pumpWidget(MaterialApp(
      home: RegisterPage(onTap: () {}),
    ));

    // Create the Finders
    final usernameFieldFinder = find.byWidgetPredicate(
      (widget) => widget is MyTextField && widget.hintText == 'Username',
    );
    final emailFieldFinder = find.byWidgetPredicate(
      (widget) => widget is MyTextField && widget.hintText == 'Email',
    );
    final passwordFieldFinder = find.byWidgetPredicate(
      (widget) => widget is MyTextField && widget.hintText == 'Password',
    );
    final confirmPasswordFieldFinder = find.byWidgetPredicate(
      (widget) => widget is MyTextField && widget.hintText == 'Confirm Password',
    );
    final registerButtonFinder = find.byType(MyButton);

    // Verify that the MyTextField and MyButton widgets are in the widget tree
    expect(usernameFieldFinder, findsOneWidget);
    expect(emailFieldFinder, findsOneWidget);
    expect(passwordFieldFinder, findsOneWidget);
    expect(confirmPasswordFieldFinder, findsOneWidget);
    expect(registerButtonFinder, findsOneWidget);
  });
}

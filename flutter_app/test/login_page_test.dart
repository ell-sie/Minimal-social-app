import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/components/my_textfield.dart';
import 'package:flutter_app/components/my_button.dart';

void main() {
  testWidgets('LoginPage Widget Test', (WidgetTester tester) async {
    // Build a dummy LoginPage widget
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo
                const Icon(
                  Icons.person,
                  size: 80,
                  color: Colors.blue,
                ),

                const SizedBox(height: 25),

                // app name
                const Text(
                  "S O C I A L",
                  style: TextStyle(fontSize: 20),
                ),

                const SizedBox(height: 50),

                // email textfield
                MyTextField(
                  controller: TextEditingController(),
                  hintText: "Email",
                  obscureText: false,
                ),

                const SizedBox(height: 10),
                //password textfield
                MyTextField(
                  controller: TextEditingController(),
                  hintText: "Password",
                  obscureText: true,
                ),

                const SizedBox(height: 10),
                // forgot password
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot Password?",
                      style: TextStyle(
                          color: Colors.blue,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 25),
                // sign in button
                MyButton(
                  text: "Login",
                  onTap: () {},
                ),

                const SizedBox(height: 25),

                // don't have account ? Register here
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(
                          color: Colors.blue,
                      ),
                    ),
                    GestureDetector(
                      child: const Text(
                        "Register Here",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));

    // Create the Finders
    final emailFieldFinder = find.byWidgetPredicate(
      (widget) => widget is MyTextField && widget.hintText == 'Email',
    );
    final passwordFieldFinder = find.byWidgetPredicate(
      (widget) => widget is MyTextField && widget.hintText == 'Password',
    );
    final loginButtonFinder = find.byType(MyButton);

    // Verify that the MyTextField and MyButton widgets are in the widget tree
    expect(emailFieldFinder, findsOneWidget);
    expect(passwordFieldFinder, findsOneWidget);
    expect(loginButtonFinder, findsOneWidget);
  });
}


import 'package:flutter/material.dart';
import 'package:shopping_app/ui/core/colors/light_color.dart';
import 'package:shopping_app/ui/core/ui/custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: backgroundColor),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(children: [Text('Login')]),
            SizedBox(height: 12),
            Form(
              child: Column(
                children: [
                  TextFormField(),
                  SizedBox(height: 4),
                  TextFormField(),
                ],
              ),
            ),

            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Text('Forgot your password')],
            ),
            SizedBox(height: 8),
            CustomElevatedButton(text: 'LOGIN', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

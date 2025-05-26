import 'package:flutter/material.dart';
import 'package:shopping_app/ui/core/colors/light_color.dart';
import 'package:shopping_app/ui/core/ui/custom_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('data'),),


      body: Center(

        child: CustomElevatedButton(text: 'text', onPressed: (){}),
      ),
    );
  }
}


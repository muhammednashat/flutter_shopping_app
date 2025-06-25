import 'package:flutter/material.dart';
import 'package:shopping_app/ui/core/ui/custom_button.dart';
import 'package:shopping_app/utils/util.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 350.0,
            width: double.infinity,
            child: Image.asset(getImagePath('bags.png')),
          ),
          Text('SUCCESS!', style: Theme.of(context).textTheme.headlineLarge),
          SizedBox(height: 24.0),
          Text(
            'Your order will be delivered soon.\nThank you for choosing our app!',
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomElevatedButton(
                text: "CONTINUE SHOPPING",
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

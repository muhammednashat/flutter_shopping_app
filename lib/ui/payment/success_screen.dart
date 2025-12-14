import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_app/routing/routes.dart';
import 'package:shopping_app/ui/core/ui/custom_button.dart';
import 'package:shopping_app/utils/util.dart';
import 'package:shopping_app/utils/utils.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
           onPopInvokedWithResult: (didPop,_) {
        myPrint("onpop") ;
        context.go(Routes.mainScreen);
      },
      child: Scaffold(
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
            const SizedBox(height: 24.0),
            const Text(
              'Your order will be delivered soon.\nThank you for choosing our app!',
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomElevatedButton(
                  text: "CONTINUE SHOPPING",
                  onPressed: () {
      context.go(Routes.mainScreen);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

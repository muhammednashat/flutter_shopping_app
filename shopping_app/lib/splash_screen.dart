import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_app/routing/routes.dart';
import 'package:shopping_app/ui/core/colors/light_color.dart';
import 'package:shopping_app/ui/core/ui/custom_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    navigateBasedState();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('data'),),


      body: Center(

        child: CustomElevatedButton(text: 'text', onPressed: (){}),
      ),
    );
  }
  
  void navigateBasedState() async{
    await Future.delayed(Durations.medium3);
    context.go(Routes.signup);
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_app/config/dependences.dart';
import 'package:shopping_app/routing/routes.dart';
import 'package:shopping_app/ui/core/ui/custom_button.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  
  @override
  void initState() {
    navigateBasedState();
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
    final boxCollection  = await ref.read(boxCollectionProvider.future);
    final appData = await boxCollection.openBox('appData');
    final isLogged = await appData.get('isLogged') ?? false;
    print(isLogged);
    await Future.delayed(Durations.medium3);
    print('delayed');
    if (isLogged) {
      print('home');
    context.go(Routes.mainScreen);
      
    } else {
      print('singUp');
    context.go(Routes.signup);
      
    }
  }
}


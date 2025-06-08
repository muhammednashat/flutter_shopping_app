import 'package:flutter/material.dart';
import 'package:shopping_app/routing/router_config.dart';
import 'package:shopping_app/ui/core/themes/light_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp.router(
      
      routerConfig: routerConfig,
      theme: lightTheme

    );
  }
}
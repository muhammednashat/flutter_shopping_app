import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(home: App(),));
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Test', style: Theme.of(context).textTheme.headlineMedium,),
        centerTitle: true,
      ),

      body: Center(
        child:Column(
          children: [
          ],
        )
      ),
    );
  }
}
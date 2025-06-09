

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shopping_app/data/model/user.dart';
import 'package:shopping_app/myapp.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  await _setUpHive(); 

  runApp(ProviderScope(child:const MyApp() ,));
}

Future<void> _setUpHive() async {
  final appDocumentDirectory =
      await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(UserAdapter()); 
}

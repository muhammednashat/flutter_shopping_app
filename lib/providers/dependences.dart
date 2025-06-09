
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shopping_app/data/repositories/authRepo.dart';
import 'package:shopping_app/data/services/api/authService.dart';



final boxCollectionProvider = FutureProvider<BoxCollection>((ref) async {
  final dir = await getApplicationDocumentsDirectory();

  final collection = await BoxCollection.open(
    'DBShopping',
    {'useres' , 'appData'},
    path: dir.path,
    // key: HiveCipher(mySecretKey), // optional encryption
  );

  return collection;
});


final authServiceProvider  = Provider((ref) => Authservice());

final authRepoProvider = FutureProvider((ref) async{
 var service = ref.watch(authServiceProvider);
 final boxCollection = await ref.watch(boxCollectionProvider.future);
return AuthRepo(service: service,boxCollection: boxCollection );
});
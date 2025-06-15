
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shopping_app/data/repositories/authRepo.dart';
import 'package:shopping_app/data/repositories/product_repo.dart';
import 'package:shopping_app/data/services/api/authService.dart';
import 'package:shopping_app/data/services/api/products_service.dart';



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

// Services
final authServiceProvider  = Provider((ref) => Authservice());
final productServiceProvider = Provider((ref)=> ProductService());

// Repos

final authRepoProvider = FutureProvider((ref) async{
 var service = ref.watch(authServiceProvider);
 final boxCollection = await ref.watch(boxCollectionProvider.future);
return AuthRepo(service: service,boxCollection: boxCollection );
});

final productRepoProvider = Provider((ref) {
  final service =  ref.watch(productServiceProvider);
  return ProductsRepo(productService: service);
});
final saleProductsProvider = FutureProvider((ref){
 final repo = ref.watch(productRepoProvider);
 return repo.retriveSallingProducts(); 
});

final newProductsProvider = FutureProvider((ref){
 final repo = ref.watch(productRepoProvider);
 return repo.retriveNewProducts(); 
});
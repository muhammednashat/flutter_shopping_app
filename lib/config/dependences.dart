import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shopping_app/data/model/category.dart';
import 'package:shopping_app/data/model/product.dart';
import 'package:shopping_app/data/repositories/authRepo.dart';
import 'package:shopping_app/data/repositories/category_repo.dart';
import 'package:shopping_app/data/repositories/product_repo.dart';
import 'package:shopping_app/data/services/api/authService.dart';
import 'package:shopping_app/data/services/api/products_service.dart';
import 'package:shopping_app/data/services/api/category_service.dart';

final boxCollectionProvider = FutureProvider<BoxCollection>((ref) async {
  final dir = await getApplicationDocumentsDirectory();

  final collection = await BoxCollection.open(
    'DBShopping',
    {'useres', 'appData'},
    path: dir.path,
    // key: HiveCipher(mySecretKey), // optional encryption
  );

  return collection;
});

// Services
final authServiceProvider = Provider((ref) => Authservice());
final productServiceProvider = Provider((ref) => ProductService());
final categoryServiceProvider = Provider((ref) => CategoryService());

// Repos
final authRepoProvider = FutureProvider((ref) async {
  var service = ref.watch(authServiceProvider);
  final boxCollection = await ref.watch(boxCollectionProvider.future);
  return AuthRepo(service: service, boxCollection: boxCollection);
});

final productRepoProvider = Provider((ref) {
  final service = ref.watch(productServiceProvider);
  return ProductsRepo(productService: service);
});

final categoryRepoProvider = Provider((ref) {
  final categoryService = ref.watch(categoryServiceProvider);
  return CategoryRepo(categoryService: categoryService);
});

final saleProductsProvider = FutureProvider((ref) {
  final repo = ref.watch(productRepoProvider);
  return repo.retriveSallingProducts();
});

final newProductsProvider = FutureProvider((ref) {
  final repo = ref.watch(productRepoProvider);
  return repo.retriveNewProducts();
});

final getProductsByCategoryProvider = FutureProvider
    .family<List<Product>, Map<String, dynamic>>((ref, query) {
      final repo = ref.watch(productRepoProvider);
      return repo.getProductsByCategory(query);
    });

final categoriesByCategoryProvider = FutureProvider
    .family<List<Category>, String>((ref, mainCategory) {
      final repo = ref.watch(categoryRepoProvider);
      return repo.getCategoriesByCategory(mainCategory);
    });

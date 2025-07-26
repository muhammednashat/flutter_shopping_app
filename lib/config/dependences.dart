import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shopping_app/data/model/category.dart';
import 'package:shopping_app/data/model/product.dart';
import 'package:shopping_app/data/model/responses/orders_response.dart';
import 'package:shopping_app/data/model/user.dart';
import 'package:shopping_app/data/repositories/authRepo.dart';
import 'package:shopping_app/data/repositories/cart_repo.dart';
import 'package:shopping_app/data/repositories/category_repo.dart';
import 'package:shopping_app/data/repositories/ordersRepo.dart';
import 'package:shopping_app/data/repositories/product_repo.dart';
import 'package:shopping_app/data/services/api/authService.dart';
import 'package:shopping_app/data/services/api/cart_service.dart';
import 'package:shopping_app/data/services/api/ordersService.dart';
import 'package:shopping_app/data/services/api/products_service.dart';
import 'package:shopping_app/data/services/api/category_service.dart';
import 'package:shopping_app/utils/utils.dart';

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

final userBoxCollictionProvider = FutureProvider((ref) async {
  final boxCollection = await ref.watch(boxCollectionProvider.future);
  final useresBox = await boxCollection.openBox('useres');
  return await useresBox.get('user') as User;
});

final userProvider = Provider((ref) async {
  final boxCollection = await ref.watch(boxCollectionProvider.future);
  final useresBox = await boxCollection.openBox('useres');
  return await useresBox.get('user') as User;
});

// Services
final authServiceProvider = Provider((ref) => Authservice());
final productServiceProvider = Provider((ref) => ProductService());
final categoryServiceProvider = Provider((ref) => CategoryService());
final cartServiceProvider = Provider((ref) => CartService());
final orderServiceProvider = Provider((ref) => OrdersService());

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

final cartRepoProvider = Provider((ref) {
  final service = ref.watch(cartServiceProvider);
  return CartRepo(service: service);
});

final ordersRepoProvider = Provider((ref) {
  final ordersService = ref.watch(orderServiceProvider);
  return OrdersRepo(ordersService: ordersService);
});

// Future Apis
final saleProductsProvider = FutureProvider((ref) {
  final repo = ref.watch(productRepoProvider);
  return repo.retriveSallingProducts();
});

final newProductsProvider = FutureProvider((ref) {
  final repo = ref.watch(productRepoProvider);
  return repo.retriveNewProducts();
});

final getProductsByCategoryProvider =
    FutureProvider.family<List<Product>, Map<String, dynamic>>((ref, query) {
      final repo = ref.watch(productRepoProvider);
      return repo.getProductsByCategory(query);
    });

final categoriesByCategoryProvider =
    FutureProvider.family<List<Category>, String>((ref, mainCategory) {
      final repo = ref.watch(categoryRepoProvider);
      return repo.getCategoriesByCategory(mainCategory);
    });

final fetchCartItemsProvider = FutureProvider.autoDispose((ref) async {
  print("-----------------------&&&&&&&&&&&&&&----------------*************");
  final cartRepo = ref.watch(cartRepoProvider);
  final user = await ref.watch(userProvider);
  myPrint(user.id);
  return cartRepo.fetchCartItems(user.id);
});

final getOrdersByStatusProvider = FutureProvider.autoDispose
    .family<List<OrdersResponse>, String>((ref, status) async {
      final user = await ref.watch(userProvider);
      final data = {"userId": user.id, "status": status};
      myPrint("fdsf");
      myPrint(data.toString());

      final cartRepo = ref.watch(ordersRepoProvider);
      return cartRepo.getOrderByStatus(data);
    });

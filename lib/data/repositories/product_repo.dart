import 'package:shopping_app/data/model/product.dart';
import 'package:shopping_app/data/services/api/products_service.dart';
import 'package:shopping_app/utils/utils.dart';

class ProductsRepo {
  final ProductService productService;

  ProductsRepo({required this.productService});
  Future<List<Product>> retriveSallingProducts() async {
    try {
      final response = await productService.retriveSallingProducts();
        myPrint(response.statusCode);
      if (response.statusCode == 200) {
        final data = response.data as List<dynamic>;
        final products = data.map((e) => Product.fromJson(e)).toList();
         myPrint(products);
        return products;
      } else {
        return List.empty();
      }
    } catch (e) {
      return List.empty();
    }
  }

  Future<List<Product>> retriveNewProducts() async {
    try {
      final response = await productService.retriveNewProducts();
      // myPrint(response.statusCode);
      if (response.statusCode == 200) {
        myPrint(response.data);
        final data = response.data as List<dynamic>;
        final products = data.map((e) => Product.fromJson(e)).toList();
        myPrint(products);
        return products;
      } else {
        return List.empty();
      }
    } catch (e) {
      return List.empty();
    }
  }

  Future<List<Product>> getProductsByCategory(
    Map<String, dynamic> query,
  ) async {
    try {
      final response = await productService.getProductsByCategory(query);
      if (response.statusCode == 200) {
        final data = response.data as List<dynamic>;
        final products = data.map((e) => Product.fromJson(e)).toList();
        myPrint(products);
        return products;
      } else {
        return List.empty();
      }
    } catch (e) {
      return List.empty();
    }
  }
}

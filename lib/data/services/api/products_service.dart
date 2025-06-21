import 'package:dio/dio.dart';
import 'package:shopping_app/utils/constants.dart';

class ProductService {
  final dio = Dio();

  Future<Response> retriveSallingProducts() async {
    return await dio.get('${Constants.baseUrl}/sale-products');
  }

  Future<Response> retriveNewProducts() async {
    return await dio.get('${Constants.baseUrl}/new-products');
  }

  Future<Response> getProductsByCategory(Map<String, dynamic> query) async {
    return await dio.get(
      '${Constants.baseUrl}/products-by-category',
      data: query,
    );
  }
}

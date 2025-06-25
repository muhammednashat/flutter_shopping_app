import 'package:dio/dio.dart';
import 'package:shopping_app/data/model/new_cart_item.dart';
import 'package:shopping_app/data/model/responses/cart_response.dart';
import 'package:shopping_app/utils/constants.dart';

class CartService {
  final dio = Dio();

  Future<Response> addItemToCart(NewCartItem item) {
    return dio.post('${Constants.baseUrl}/add-cart-item', data: item.toJson());
  }

  Future<Response> getCartItems(String userId)  {
    return  dio.get(
      '${Constants.baseUrl}/get-cart-items',
      data: {"userId": userId},
    );
  }

  Future<Response> deletCartItem(Map<String, Object> json) async {
    return dio.delete('${Constants.baseUrl}/delete-cart-item', data: json);
  }
}

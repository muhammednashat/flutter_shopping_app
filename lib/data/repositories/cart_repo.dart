import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:shopping_app/data/model/new_cart_item.dart';
import 'package:shopping_app/data/model/responses/cart_item_response.dart';
import 'package:shopping_app/data/model/responses/cart_response.dart';
import 'package:shopping_app/data/model/responses/response.dart';
import 'package:shopping_app/data/services/api/cart_service.dart';
import 'package:shopping_app/utils/utils.dart';

class CartRepo {
  final CartService service;
  CartRepo({required this.service});

  Future<bool> insertItemIntoCart(NewCartItem item) async {
    myPrint("cartREpo");
    try {
      myPrint(" final response = await service.addItemToCart(item);");
      final response = await service.addItemToCart(item);
      myPrint(response.data);
      return true;
    } catch (e) {
      myPrint(e);
      return false;
    }
  }

  Future<CartResponse> fetchCartItems(String userId) async {

    try {
      final response = await service.getCartItems("687228432fe6bd22da925bdf");
      myPrint(response);
      final json = response.data as Map<String, dynamic>;
      myPrint("CartResponse");

      return CartResponse.fromJson(json);
    } catch (e) {
      myPrint("catch =? $e");

      return CartResponse.error(e.toString());
    }
  }

  Future<CartResponse> deletCartItem(Map<String, Object> json) async {
    try {
      final response = await service.deletCartItem(json);
      return extractCartItems(response);
    } catch (e) {
      return CartResponse.error(e.toString());
    }
  }

  CartResponse extractCartItems(Response response) {
    final json = response.data as Map<String, dynamic>;
    return CartResponse.fromJson(json);
  }
}

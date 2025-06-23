import 'package:shopping_app/data/model/responses/cart_item_response.dart';

class CartResponse {
  
  int status;
  String msg;
  String cartId;
  List<CartItemResponse>? items;
  
  CartResponse({
    required this.status,
    required this.msg,
    required this.cartId,
    required this.items,
  });


  factory CartResponse.fromJson(Map<String, dynamic> json) {
    return CartResponse(
      status: json['status'] as int,
      msg: json['msg'] as String,
      cartId: json['cartId'] as String,
      items: (json['items'] as List<dynamic>)
          .map((item) => CartItemResponse.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}
import 'package:shopping_app/data/model/responses/cart_item_response.dart';
import 'package:shopping_app/utils/utils.dart';

class CartResponse {
  int status;
  String msg;
  String cartId;
  double? totalPrice;
  List<CartItemResponse>? items;

  CartResponse({
    required this.status,
    required this.msg,
    this.totalPrice,
    required this.cartId,
    required this.items,
  });

  factory CartResponse.error(String error) {
    return CartResponse(
      status: 401,
      msg: "Sorry, we cann\'t git data now,\n try later",
      cartId: "0",
      items: List.empty(),
    );
  }

  factory CartResponse.fromJson(Map<String, dynamic> json) {
    final list = json['items'] as List<dynamic>;
    final items = list.map((e) => CartItemResponse.fromJson(e)).toList();
    return CartResponse(
      status: json['status'] as int,
      msg: json['msg'] as String,
      cartId: json['cartId'] as String,
      items: items,
      totalPrice: json['totalPrice'],
      // json['items']?.map((item) =>CartItemResponse.fromJson(item as Map<String, dynamic>),).toList(),
    );
  }

  @override
  String toString() {
    return 'CartResponse(status: $status, msg: $msg, cartId: $cartId, items: $items)';
  }
}

import 'package:shopping_app/data/model/cart_item_response_model.dart';

class CartResponse {
  String id;
  String userId;
  List<CartItemResponseModel> items;

  CartResponse({
    required this.id,
    required this.userId,
    required this.items,
  });

  factory CartResponse.fromJson(Map<String, dynamic> json) {
    return CartResponse(
      id: json['id'],
      userId: json['userId'],
      items: (json['items'] as List)
          .map((e) => CartItemResponseModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'items': items.map((e) => e.toJson()).toList(),
      };
}
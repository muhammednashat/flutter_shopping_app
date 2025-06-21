// for store data
import 'package:shopping_app/data/model/cart_item_model.dart';

class CartModel {
  String id;
  String userId;
  List<CartItemModel> items;

  CartModel({
    required this.id,
    required this.userId,
    required this.items,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      userId: json['userId'],
      items: (json['items'] as List)
          .map((e) => CartItemModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'items': items.map((e) => e.toJson()).toList(),
      };
}




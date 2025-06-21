
class CartItemModel {
  String id;
  String productId;
  int quantity;
  String? size;

  CartItemModel({
    required this.id,
    required this.productId,
    this.quantity = 1,
    this.size,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id'],
      productId: json['productId'],
      quantity: json['quantity'] ?? 1,
      size: json['size'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'productId': productId,
        'quantity': quantity,
        'size': size,
      };
}
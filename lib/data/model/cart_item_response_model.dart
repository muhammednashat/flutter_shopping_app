class CartItemResponseModel {
  String id;
  String productId;
  int quantity;
  String? size;
  String? color;
  String imgUrl;
  double price;

  CartItemResponseModel({
    required this.id,
    required this.productId,
    required this.quantity,
    this.size,
    this.color,
    required this.imgUrl,
    required this.price,
  });

  factory CartItemResponseModel.fromJson(Map<String, dynamic> json) {
    return CartItemResponseModel(
      id: json['id'],
      productId: json['productId'],
      quantity: json['quantity'],
      size: json['size'],
      color: json['color'],
      imgUrl: json['imgUrl'],
      price: (json['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'productId': productId,
        'quantity': quantity,
        'size': size,
        'color': color,
        'imgUrl': imgUrl,
        'price': price,
      };
}
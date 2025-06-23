class CartItemResponse {
  String id;
  String productId;
  int quantity;
  String? size;
  String? color;
  String imgUrl;
  double price;

  CartItemResponse({
    required this.id,
    required this.productId,
    required this.quantity,
    this.size,
    this.color,
    required this.imgUrl,
    required this.price,
  });

  factory CartItemResponse.fromJson(Map<String, dynamic> json) {
    return CartItemResponse(
      id: json['_id'],
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
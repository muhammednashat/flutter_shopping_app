class CartItemResponse {
  String id;
  double salePrice;
  int quantity;
  String name;
  String imageUrl;
  String size;
  double price;

  CartItemResponse({
    required this.id,
    required this.salePrice,
    required this.quantity,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.size,
  });

  factory CartItemResponse.fromJson(Map<String, dynamic> json) {
    return CartItemResponse(
      id: json['id'],
      salePrice: json['salePrice'],
      quantity: json['quantity'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      size: json['size'],
      price: (json['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'salePrice': salePrice,
    'quantity': quantity,
    'name': name,
    'imageUrl': imageUrl,
    'price': price,
    'size': size,

  };



@override
String toString() {
  return 'CartItemResponse(id: $id, name: $name, quantity: $quantity, price: $price, size: $size)';
}


}

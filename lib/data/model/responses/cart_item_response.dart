class CartItemResponse {
  String id;
  double salePrice;
  int quantity;
  String? name;
  String imageUrl;
  double price;

  CartItemResponse({
    required this.id,
    required this.salePrice,
    required this.quantity,
    required this.name,
    required this.imageUrl,
    required this.price,
  });

  factory CartItemResponse.fromJson(Map<String, dynamic> json) {
    return CartItemResponse(
      id: json['id'],
      salePrice: json['salePrice'],
      quantity: json['quantity'],
      name: json['name'],
      imageUrl: json['imageUrl'],
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
  };



@override
String toString() {
  return 'CartItemResponse(id: $id, name: $name, quantity: $quantity, price: $price)';
}


}

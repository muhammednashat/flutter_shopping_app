
class NewCartItem{


  String userId;
  String productId;
  String size;
  int quantity;

  NewCartItem({
    required this.userId,
    required this.productId,
    required this.size,
    required this.quantity,
  });

  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "productId": productId,
      "size": size,
      "quantity": quantity,
    };
  }

}
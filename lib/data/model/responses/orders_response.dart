import 'package:shopping_app/data/model/responses/cart_item_response.dart';
import 'package:shopping_app/utils/utils.dart';

class OrdersResponse {
  String userId;
  DateTime date;
  String status;
  double totalAmount;
  int quantity;
  String shippingAddress;
  String deliveryMethod;
  List<CartItemResponse> items;

  OrdersResponse({
    required this.userId,
    required this.date,
    required this.status,
    required this.totalAmount,
    required this.quantity,
    required this.shippingAddress,
    required this.deliveryMethod,
    required this.items,
  });

  factory OrdersResponse.fromJson(Map<String, dynamic> json) {
    final items =
        (json['items'] as List<dynamic>)
            .map((e) => CartItemResponse.fromJson(e))
            .toList();
    myPrint(items);
    return OrdersResponse(
      userId: json['userId'],
      date: DateTime.parse(json['date']),
      status: json['status'],
      totalAmount: json['totalAmount'].toDouble(),
      quantity: json['quantity'],
      shippingAddress: json['shippingAddress'],
      deliveryMethod: json['deliveryMethod'],
      items: items,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'date': date.toIso8601String(),
      'status': status,
      'totalAmount': totalAmount,
      'quantity': quantity,
      'shippingAddress': shippingAddress,
      'deliveryMethod': deliveryMethod,
      'items': items,
    };
  }

  @override
  String toString() {
    return '''
OrdersResponse(
  userId: $userId,
  date: $date,
  status: $status,
  totalAmount: $totalAmount,
  quantity: $quantity,
  shippingAddress: $shippingAddress,
  deliveryMethod: $deliveryMethod,
  items: $items
)''';
  }
}

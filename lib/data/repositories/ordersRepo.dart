import 'package:shopping_app/data/model/responses/orders_response.dart';
import 'package:shopping_app/data/services/api/ordersService.dart';
import 'package:shopping_app/utils/utils.dart';

class OrdersRepo {
  final OrdersService ordersService;
  OrdersRepo({required this.ordersService});

  Future<List<OrdersResponse>> getOrderByStatus(
    Map<String, dynamic> data,
  ) async {
    try {
      final response = await ordersService.getOrderByStatus(data);
      final json = response.data as List<dynamic>;
      final ordersResponse =
          json.map((element) => OrdersResponse.fromJson(element)).toList();

      //   myPrint(ordersResponse);
      // myPrint(response);
      return ordersResponse;
    } catch (e) {
      myPrint(e);

      return [];
    }
  }

  Future<void> submitOrder(String userId) async {
    myPrint("usr id is  => $userId");

    try {
      final response = await ordersService.submitOrder(userId);
      myPrint(response);
    } catch (e) {
      myPrint(e);
    }
  }
}

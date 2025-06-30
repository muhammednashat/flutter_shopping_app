import 'package:dio/dio.dart';
import 'package:shopping_app/utils/constants.dart';

class OrdersService {
  final dio = Dio();

  Future<Response> submitOrder(String userId) async {

    return await dio.post('${Constants.baseUrl}/submit-order' , data: {userId:userId});
  }

  Future<Response> getOrderByStatus(Map<String, dynamic> data) async {
    return await dio.get('${Constants.baseUrl}/get-orders-by-status', data: data);
  }
}

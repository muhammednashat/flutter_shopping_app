import 'package:dio/dio.dart';
import 'package:shopping_app/utils/constants.dart';

class CartService {
  final dio = Dio();

  Future<Response> addItemToCart(){
    return dio.post(
     '${Constants.baseUrl}/get-categories-by-category',
      data: 
    ) ;
  }



  // Future<Response> (){
  //   return dio ;
  // }
  // Future<Response> (){
  //   return dio ;
  // }
}
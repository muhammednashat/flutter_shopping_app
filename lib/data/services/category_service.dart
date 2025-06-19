import 'package:dio/dio.dart';
import 'package:shopping_app/utils/constants.dart';

class CategoryService {


  final dio = Dio();

 Future<Response> getCategoriesByCategory(String category) async{
    return await dio.get('${Constants.baseUrl}/get-categories-by-category');
 }
  

  
}
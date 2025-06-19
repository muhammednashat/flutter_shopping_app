import 'package:shopping_app/data/model/category.dart';
import 'package:shopping_app/data/services/category_service.dart';

class CategoryRepo {
  
  final CategoryService categoryService;
  CategoryRepo ({required this.categoryService});

Future<List<Category>> getCategoriesByCategory(String category)async{
  try {
    final response = await categoryService.getCategoriesByCategory(category);
    if (response.statusCode == 200) {
      final data = response.data as List<dynamic> ;
      final categories = data.map((e) => Category.fromJson(e)).toList();
      return categories;
    } else {
   return List.empty();   
    } 
  } catch (e) {
   return List.empty();   
  }
 }


}
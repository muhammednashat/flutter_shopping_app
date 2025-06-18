import 'package:shopping_app/data/model/product.dart';

class Category {
  
  String imageUrl;
  String category;
  String mainCategory;
  String subCategory;
  List<Product> products;
  Category({required this.category,required this.mainCategory, required this.subCategory,required this.products , required this.imageUrl});

toJson(){}
}

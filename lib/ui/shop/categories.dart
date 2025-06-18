import 'package:flutter/material.dart';
import 'package:shopping_app/data/model/product.dart';
import 'package:shopping_app/ui/core/colors/light_color.dart';
import 'package:shopping_app/ui/core/ui/category_item.dart';

class Category {
  String name;
  String imageUrl;
  List<Product> products;

  Category({required this.name, required this.products , required this.imageUrl});
}

Product product = Product(id: 'id', name: 'name', imageUrl: 'https://raw.githubusercontent.com/muhammednashat/images_shopping_app/main/boy_t_shirt1.jpg', category: 'category', isNew: true, isOnSale: true, brandName: 'brandName', rating: 25.0, originalPrice: 25.0, salePrice: 52.5, discount: '25.0%', description: 'description', mainCategory: 'mainCategory', subCategory: 'subCategory', numRating: 52);

List<Category> categories = [
   Category(name: "Tops" ,imageUrl: 'https://raw.githubusercontent.com/muhammednashat/images_shopping_app/main/boy_t_shirt1.jpg' ,products:[product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,] ),
   Category(name: "New" ,imageUrl: 'https://raw.githubusercontent.com/muhammednashat/images_shopping_app/main/boy_t_shirt1.jpg' ,products:[product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,] ),
   Category(name: "Nike" ,imageUrl: 'https://raw.githubusercontent.com/muhammednashat/images_shopping_app/main/boy_t_shirt1.jpg' ,products:[product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,] ),
   Category(name: "New" ,imageUrl: 'https://raw.githubusercontent.com/muhammednashat/images_shopping_app/main/boy_t_shirt1.jpg' ,products:[product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,] ),
   Category(name: "New" ,imageUrl: 'https://raw.githubusercontent.com/muhammednashat/images_shopping_app/main/boy_t_shirt1.jpg' ,products:[product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,] ),
   Category(name: "New" ,imageUrl: 'https://raw.githubusercontent.com/muhammednashat/images_shopping_app/main/boy_t_shirt1.jpg' ,products:[product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,] ),
   Category(name: "New" ,imageUrl: 'https://raw.githubusercontent.com/muhammednashat/images_shopping_app/main/boy_t_shirt1.jpg' ,products:[product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,] ),
   Category(name: "New" ,imageUrl: 'https://raw.githubusercontent.com/muhammednashat/images_shopping_app/main/boy_t_shirt1.jpg' ,products:[product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,] ),
   Category(name: "New" ,imageUrl: 'https://raw.githubusercontent.com/muhammednashat/images_shopping_app/main/boy_t_shirt1.jpg' ,products:[product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,] ),
   Category(name: "New" ,imageUrl: 'https://raw.githubusercontent.com/muhammednashat/images_shopping_app/main/boy_t_shirt1.jpg' ,products:[product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,product,] ),
];

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Card(
              color: primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Text(
                      'SUMMER SALES',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium?.copyWith(color: Colors.white),
                    ),
                    Text(
                      'Up to 50% off',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
         Expanded(child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context,index){
            final category = categories[index];
          return  CategoryItem(name:category.name , imageUrl: category.imageUrl, products: category,);
          }
          ))
        
        ],
      ),
    );
  }
}

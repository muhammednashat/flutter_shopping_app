import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/data/model/product.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.name, required this.imageUrl, required this.products});
  final Category category;
  final String imageUrl;
  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: SizedBox(
        height: 130,
        child: Card(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
               flex: 1
                ,child: Center(child: Text(name , style: Theme.of(context).textTheme.headlineSmall,))),
              Flexible(
                flex: 2,
                child: Image.network(
                 imageUrl,
                  width: 200,
                  fit: BoxFit.fill,
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
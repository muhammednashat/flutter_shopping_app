import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_app/data/model/category.dart';
import 'package:shopping_app/routing/routes.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({super.key, required this.category});
  final Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(Routes.displayCategoryProducts, extra: category);
      },
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: SizedBox(
          height: 130,
          child: Card(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 1,
                  child: Center(
                    child: Text(
                      category.subCategory,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Image.network(
                    category.imageUrl,
                    width: 200,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

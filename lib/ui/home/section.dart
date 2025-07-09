import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_app/data/model/product.dart';
import 'package:shopping_app/routing/routes.dart';
import 'package:shopping_app/ui/core/colors/light_color.dart';
import 'package:shopping_app/ui/core/ui/product_card.dart';

class SectionWidget extends StatelessWidget {
  final String title;
  final String subTile;
  final bool isNew;
  final List<Product> products;
  const SectionWidget({
    super.key,
    required this.title,
    required this.subTile,
    required this.products,
    required this.isNew,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: Theme.of(context).textTheme.headlineLarge),
            GestureDetector(
              onTap: () {
                context.push(
                  Routes.displayAllProducts,
                  extra: {'title': title, 'products': products},
                );
              },
              child: Text(
                'view all',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(color: primaryColor),
              ),
            ),
          ],
        ),

        Text(subTile, style: Theme.of(context).textTheme.titleSmall),
        SizedBox(height: 24),
        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder:
                (context, index) =>
                    ProductCard(isNew: isNew, product: products[index]),
          ),
        ),
      ],
    );
  }
}

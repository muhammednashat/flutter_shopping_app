import 'package:flutter/material.dart';
import 'package:shopping_app/data/model/product.dart';
import 'package:shopping_app/ui/core/colors/light_color.dart';
import 'package:shopping_app/ui/core/ui/rating_widget.dart';

class ProductCardHorizontally extends StatelessWidget {
  const ProductCardHorizontally({super.key, required this.product});
final Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product.imageUrl,
              width: 130.0,
              height: 120.0,
              fit: BoxFit.fill,
              ),
            SizedBox(width: 24.0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.0,),
                Text(product.brandName, style: Theme.of(context).textTheme.titleMedium,),
                Text(product.name, style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: gray1
                ),),
                CustomRatingWidget(initialRating: product.rating, numRating:product.numRating),
                Text('${product.salePrice}\$', style: Theme.of(context).textTheme.titleMedium,),
              ],
            ),
          
          ],
        ),
      ),
    );
  }
}
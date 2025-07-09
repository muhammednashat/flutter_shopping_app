import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_app/data/model/product.dart';
import 'package:shopping_app/routing/routes.dart';
import 'package:shopping_app/ui/core/colors/light_color.dart';
import 'package:shopping_app/ui/core/ui/rating_widget.dart';
import 'package:shopping_app/utils/util.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final bool? isNew;
  const ProductCard({super.key, required this.product, this.isNew});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SizedBox(
        width: 160.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    context.push(Routes.displayProduct, extra: product);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      product.imageUrl,
                      width: 160.0,
                      height: 200.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                if (isNew != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DynamicWidget(
                      text: (isNew!) ? 'New' : product.discount,
                      backgroundColor: (isNew!) ? blackColor : primaryColor,
                    ),
                  ),
                PositionedDirectional(
                  bottom: 10,
                  end: 10,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite_border, color: gray2, size: 25),
                    ),
                  ),
                ),
                SizedBox(height: 12),
              ],
            ),

            SizedBox(height: 8.0),
            CustomRatingWidget(
              initialRating: product.rating.toDouble(),
              numRating: product.numRating,
            ),

            SizedBox(width: 4.0),
            Text(
              product.name,
              maxLines: 1,
              overflow: TextOverflow.clip,

              style: Theme.of(context).textTheme.titleSmall,
            ),
            SizedBox(width: 4.0),
            Text(
              product.brandName,

              style: Theme.of(context).textTheme.titleMedium,
            ),
            Row(
              children: [
                Text(
                  '${product.originalPrice}\$',
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: gray2,
                  ),
                ),
                SizedBox(width: 4.0),
                Text(
                  '${product.salePrice}\$',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DynamicWidget extends StatelessWidget {
  const DynamicWidget({
    super.key,
    required this.text,
    required this.backgroundColor,
  });

  final String text;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),

      child: Text(text, style: TextStyle(color: Colors.white)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: backgroundColor,
      ),
    );
  }
}

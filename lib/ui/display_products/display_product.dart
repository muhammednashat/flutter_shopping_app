import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shopping_app/data/model/product.dart';
import 'package:shopping_app/ui/core/colors/light_color.dart';
import 'package:shopping_app/ui/core/ui/custom_button.dart';
import 'package:shopping_app/ui/core/ui/favorite_button.dart';
import 'package:shopping_app/ui/core/ui/rating_widget.dart';

class DisplayProdcut extends StatefulWidget {
  const DisplayProdcut({super.key, required this.product});

  final Product product;

  @override
  State<DisplayProdcut> createState() => _DisplayProdcutState();
}

class _DisplayProdcutState extends State<DisplayProdcut> {
  late Product _product;
  @override
  void initState() {
    _product = widget.product;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          _product.name,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.network(
                    _product.imageUrl,
                    height: 350.0,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizeItemWidget(size: 'S'),
                                SizeItemWidget(size: 'M'),
                                SizeItemWidget(size: 'L'),
                              ],
                            ),
                            FavoriteButtonWidget(),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _product.name,
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                            Text(
                              '\$${_product.salePrice}',
                              style: Theme.of(context).textTheme.headlineLarge,
                            ),
                          ],
                        ),
                        Text(
                          _product.brandName,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          children: [
                            CustomRatingWidget(
                              initialRating: _product.rating.toDouble(),
                              numRating: _product.numRating,
                            ),
                            SizedBox(width: 4.0),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          _product.description,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              child: CustomElevatedButton(
                text: 'Add to cart',
                onPressed: () {},
              ),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class SizeItemWidget extends StatelessWidget {
  final String size;

  const SizeItemWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: 40.0,
        height: 40.0,
        child: Center(
          child: Text(
            size,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1.5, color: gray1),
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }
}

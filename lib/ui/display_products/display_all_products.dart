import 'package:flutter/material.dart';
import 'package:shopping_app/data/model/product.dart';
import 'package:shopping_app/ui/core/ui/product_card.dart';

class DisplayAllProducts extends StatefulWidget {
  const DisplayAllProducts({
    super.key,
    required this.title,
    required this.products,
  });

  final String title;
  final List<Product> products;

  @override
  State<DisplayAllProducts> createState() => _DisplayAllProductsState();
}

class _DisplayAllProductsState extends State<DisplayAllProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(
            widget.products.length,
            (index) => ProductCard(product: widget.products[index]),
          ),
        ),
      ),
    );
  }
}

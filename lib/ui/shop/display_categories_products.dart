import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/config/dependences.dart';
import 'package:shopping_app/data/model/category.dart';
import 'package:shopping_app/ui/core/ui/product_card.dart';

class DisplayCategoriesProducts extends ConsumerStatefulWidget {
  const DisplayCategoriesProducts({super.key, required this.category});

  final Category category;

  @override
  ConsumerState<DisplayCategoriesProducts> createState() =>
      _DisplayCategoriesProductsState();
}

class _DisplayCategoriesProductsState
    extends ConsumerState<DisplayCategoriesProducts> {
  late Category _category;
  late final Map<String, dynamic> query;
  @override
  void initState() {
    _category = widget.category;
    query = {
        "mainCategory": _category.mainCategory,
        "subCategory": _category.subCategory,
      };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final products = ref.watch(
      getProductsByCategoryProvider(query),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('${_category.mainCategory}\'s ${_category.subCategory}'),
      ),
      body: Column(
        children: [
          SizedBox(height: 8.0),
        Expanded(
  child: switch (products) {
    AsyncData(:final value) => GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: .6,
      ),
      itemCount: value.length,
      itemBuilder: (_, index) => ProductCard(product: value[index]),
    ),
    AsyncError(:final error) => Center(child: Text('$error')),
    _ => Center(child: CircularProgressIndicator()),
  },
),

        ],
      ),
    );
  }
}

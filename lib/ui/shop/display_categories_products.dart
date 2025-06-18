import 'package:flutter/material.dart';
import 'package:shopping_app/data/model/category.dart';
import 'package:shopping_app/ui/core/ui/product_card.dart';

class DisplayCategoriesProducts extends StatefulWidget {
  const DisplayCategoriesProducts({super.key, required  this.category});


final Category category;
  @override
  State<DisplayCategoriesProducts> createState() => _DisplayCategoriesProductsState();
}

class _DisplayCategoriesProductsState extends State<DisplayCategoriesProducts> {
 
 late Category _category;
@override
  void initState() {
   _category = widget.category;
    super.initState();
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${_category.mainCategory}\'s ${_category.subCategory}'),
      ),
      body: Column(
        children: [
         
          SizedBox(height: 8.0,),
            Expanded(
              child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio:.6, 
                      ),
                      itemCount: _category.products.length,
                      itemBuilder: (_, index) => ProductCard(product:  _category.products[index]),
                    ),
            )
        ],
      ),
    );
  }
}
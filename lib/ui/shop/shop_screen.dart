import 'package:flutter/material.dart';
import 'package:shopping_app/ui/shop/categories.dart';
import 'package:shopping_app/ui/shop/display_item.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
       initialIndex: 0,
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Categories'),
            bottom: TabBar(
              labelColor: Colors.white,
              dividerColor: Colors.transparent,
              tabs: [
                Tab(text: 'Men'),
                Tab(text: 'Boys'),
                Tab(text: 'Kids'),
                Tab(text: 'Women'),
                Tab(text: 'Girls'),
              ],
            ),
            
        ),
            body: TabBarView(
          children: [
            CategoriesScreen(),
             CategoriesScreen(),
            CategoriesScreen(),
             CategoriesScreen(),
            CategoriesScreen(),
          ],
        ),
      ),
    );
  }
}
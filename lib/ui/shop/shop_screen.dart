import 'package:flutter/material.dart';
import 'package:shopping_app/ui/core/colors/light_color.dart';
import 'package:shopping_app/ui/shop/categories.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Categories'),
          bottom: TabBar(
            labelStyle: Theme.of(context).textTheme.titleMedium,
            isScrollable: true,
            labelColor: primaryColor,
            indicatorColor: primaryColor,
            dividerColor: blackColor,
            indicatorWeight: 8.0,
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
            CategoriesScreen(mainCategory: 'Men'),
            CategoriesScreen(mainCategory: 'Boys'),
            CategoriesScreen(mainCategory: 'Kids'),
            CategoriesScreen(mainCategory: 'Girls'),
            CategoriesScreen(mainCategory: 'Girls'),
          ],
        ),
      ),
    );
  }
}

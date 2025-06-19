import 'package:flutter/material.dart';
import 'package:shopping_app/ui/core/colors/light_color.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Card(
              color: primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Text(
                      'SUMMER SALES',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium?.copyWith(color: Colors.white),
                    ),
                    Text(
                      'Up to 50% off',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),


        //  Expanded(child: ListView.builder(
        //   itemCount: categories.length,
        //   itemBuilder: (context,index){
        //     final category = categories[index];
        //   return  CategoryItemWidget(category: category,);
        //   }
        //   )
          // )
        
        ],
      ),
    );
  }
}

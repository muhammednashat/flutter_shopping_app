import 'package:flutter/material.dart';
import 'package:shopping_app/ui/core/ui/product_card.dart';

class SectionWidget extends StatelessWidget {

  final String title;
  final String subTile;

  const SectionWidget({super.key, required this.title, required this.subTile});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title , style: Theme.of(context).textTheme.headlineLarge,),
          GestureDetector(
            onTap: () {
              
            },
            child: Text('view all'))
        ],
      ),
      
      Text(subTile,style: Theme.of(context).textTheme.titleSmall,),
      SizedBox(height: 24,)
      ,ProductCard()
    ],
    );
  }
}

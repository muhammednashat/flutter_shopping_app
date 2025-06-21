import 'package:flutter/material.dart';
import 'package:shopping_app/ui/core/colors/light_color.dart';
import 'package:shopping_app/ui/core/ui/cart_item_quantaty_control.dart';
import 'package:shopping_app/utils/util.dart';

class ItemCard extends StatefulWidget {
  const ItemCard({super.key});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Flexible(
            flex: 1,
            child: Image.asset(
              getImagePath('image1.jpeg'),
              width: 130,
              height: 130,
            ),
          ),
          SizedBox(width: 4.0),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Name",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.more_vert_outlined, color: gray1),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Size"),
                      SizedBox(width: 4.0),
                      Text("L", style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),

                  CartItemQuantityControl(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

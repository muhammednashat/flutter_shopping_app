import 'package:flutter/material.dart';
import 'package:shopping_app/data/model/responses/cart_item_response.dart';
import 'package:shopping_app/ui/core/colors/light_color.dart';

class ItemCard extends StatefulWidget {
  const ItemCard({
    super.key,
    required this.item,
    this.shouldShowMoreIcon = false,
  });
  final bool shouldShowMoreIcon;
  final CartItemResponse item;
  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  late CartItemResponse _item;
  @override
  void initState() {
    _item = widget.item;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: Image.network(
              _item.imageUrl,
              width: 130,
              fit: BoxFit.cover,

              height: 130,
            ),
          ),
          SizedBox(width: 4.0),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          _item.name!,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      if (widget.shouldShowMoreIcon)
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.more_vert_outlined, color: gray1),
                        ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    children: [
                      Text("Size"),
                      SizedBox(width: 4.0),
                      Text(
                        _item.size,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '${_item.salePrice}\$',
                        style: Theme.of(
                          context,
                        ).textTheme.titleMedium?.copyWith(fontSize: 20.0),
                      ),
                      // Row(
                      //   children: [
                      //     QuantatyControl(icon: Icons.remove),
                      //     SizedBox(width: 6.0),
                      //     Text('1', style: Theme.of(context).textTheme.titleMedium),
                      //     SizedBox(width: 6.0),
                      //     QuantatyControl(icon: Icons.add),
                      //   ],
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

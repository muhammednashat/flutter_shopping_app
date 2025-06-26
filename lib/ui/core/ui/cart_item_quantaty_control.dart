import 'package:flutter/material.dart';
import 'package:shopping_app/ui/core/colors/light_color.dart';

class CartItemQuantityControl extends StatelessWidget {
  const CartItemQuantityControl({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            '30\$',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontSize: 24.0),
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
    );
  }
}

class QuantatyControl extends StatelessWidget {
  const QuantatyControl({super.key, required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: IconButton(
          onPressed: () {},
          icon: Icon(size: 20.0, icon, color: gray1),
        ),
      ),
    );
  }
}

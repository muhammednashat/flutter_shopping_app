import 'package:flutter/material.dart';
import 'package:shopping_app/ui/bag/item_card.dart';
import 'package:shopping_app/ui/core/ui/custom_button.dart';

class BagScreen extends StatelessWidget {
  const BagScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bag'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 51,
                itemBuilder: (context, index) => ItemCard(),
              ),
            ),
            SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total price:',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  '452\$',
                  style: Theme.of(
                    context,
                  ).textTheme.titleMedium?.copyWith(fontSize: 24.0),
                ),
              ],
            ),
            CustomElevatedButton(text: 'CHECK OUT', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
















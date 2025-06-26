import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_app/config/dependences.dart';
import 'package:shopping_app/data/model/responses/cart_response.dart';
import 'package:shopping_app/routing/routes.dart';
import 'package:shopping_app/ui/bag/item_card.dart';
import 'package:shopping_app/ui/core/colors/light_color.dart';
import 'package:shopping_app/ui/core/ui/custom_button.dart';

class BagScreen extends ConsumerStatefulWidget {
  const BagScreen({super.key});

  @override
  ConsumerState<BagScreen> createState() => _BagScreenState();
}

class _BagScreenState extends ConsumerState<BagScreen> {
  @override
  Widget build(BuildContext context) {
    final cartResponse = ref.watch(
      fetchCartItemsProvider("685bbc9dcc011d99438160e8"),
    );

    return Scaffold(
      appBar: AppBar(title: Text('Bag'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: switch (cartResponse) {
            AsyncData(:final value) =>
              (value.status == 200)
                  ? CartItemsWidget(cartResponse: value)
                  : Center(child: Text(value.msg)),
            AsyncError(:final error) => Center(child: Text(error.toString())),
            _ => Center(child: CircularProgressIndicator()),
          },
        ),
      ),
    );
  }
}

class CartItemsWidget extends StatelessWidget {
  final CartResponse cartResponse;
  const CartItemsWidget({super.key, required this.cartResponse});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: cartResponse.items?.length,
            itemBuilder: (context, index) {
              final item = cartResponse.items?[index];
              return ItemCard(item: item!);
            },
          ),
        ),

        SizedBox(height: 24.0),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total price",
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: gray1),
            ),
            Text(
              '${cartResponse.totalPrice}\$',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontSize: 24.0),
            ),
          ],
        ),
        CustomElevatedButton(
          text: 'CHECK OUT',
          onPressed: () {
            context.push(Routes.checkOut,extra: cartResponse);
          },
        ),
      ],
    );
  }
}

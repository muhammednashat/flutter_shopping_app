import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/config/dependences.dart';
import 'package:shopping_app/ui/orders/order_item_card.dart';
import 'package:shopping_app/utils/utils.dart';

class OrdersWidget extends ConsumerStatefulWidget {
  const OrdersWidget({super.key, required this.status});
  final String status;
  @override
  ConsumerState<OrdersWidget> createState() => _OrdersWidgetState();
}

class _OrdersWidgetState extends ConsumerState<OrdersWidget> {
  late Map<String, dynamic> data;

  @override
  void initState() {
    data = {"userId": "685bbc9dcc011d99438160e8", "status": widget.status};
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    myPrint(widget.status);
    //  final user = ref.read(userBoxCollictionProvider);
    //   final userId = user.id;

    final ordersAsync = ref.watch(getOrdersByStatusProvider(data));

    return ordersAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
      data:
          (orders) =>
              orders.isEmpty
                  ? const Center(child: Text('No orders found'))
                  : Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ListView.builder(
                      itemCount: orders.length,
                      itemBuilder: (context, index) {
                        final order = orders[index];
                        return OrderItemCard(order: order,);
                      },
                    ),
                  ),
    );
  }
}

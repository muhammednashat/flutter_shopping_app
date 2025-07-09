import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/ui/core/colors/light_color.dart';
import 'package:shopping_app/ui/orders/orders_widget.dart';

class OrdersScreen extends ConsumerStatefulWidget {
  const OrdersScreen({super.key});

  @override
  ConsumerState<OrdersScreen> createState() => _OrdersState();
}

class _OrdersState extends ConsumerState<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Orders")),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(
              labelStyle: Theme.of(context).textTheme.titleMedium,
              isScrollable: true,
              labelColor: primaryColor,
              indicatorColor: primaryColor,
              dividerColor: blackColor,
              indicatorWeight: 8.0,

              tabs: [
                Tab(text: 'Delivered'),
                Tab(text: 'Processing'),
                Tab(text: 'Cancelled'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  OrdersWidget(status: 'Delivered'),
                  OrdersWidget(status: 'Processing'),
                  OrdersWidget(status: 'Cancelled'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

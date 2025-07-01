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
      appBar: AppBar(title: Text("Orders"), centerTitle: true),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(
              labelPadding: EdgeInsets.symmetric(horizontal: 18.0),
              labelColor: Colors.white,
              unselectedLabelColor: blackColor,
              indicator: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
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

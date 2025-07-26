import 'package:flutter/material.dart';
import 'package:shopping_app/data/model/responses/orders_response.dart';
import 'package:shopping_app/ui/bag/item_card.dart';
import 'package:shopping_app/ui/core/colors/light_color.dart';
import 'package:shopping_app/utils/utils.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key, required this.order});
  final OrdersResponse order;
  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  late OrdersResponse order;

  @override
  void initState() {
    order = widget.order;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final status = order.status;
    myPrint(widget.order);
    return Scaffold(
      appBar: AppBar(title: Text('Order Details'), centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order Information',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    status,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color:
                          (status == "Processing")
                              ? yellew
                              : (status == "Delivered")
                              ? green
                              : primaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              ItemRow(label: "Order No:", value: (order.id).substring(1, 8)),
              SizedBox(height: 8.0),
              ItemRow(
                label: "Date:",
                value: (order.date.toString()).substring(0, 11),
              ),
              SizedBox(height: 8.0),

              ItemRow(label: "Quantity", value: '${order.quantity}'),
              SizedBox(height: 8.0),

              ItemRow(label: "Total Amount", value: '${order.totalAmount}\$'),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Delivery Method", style: TextStyle(color: gray1)),
                  SizedBox(width: 24),
                  Expanded(
                    child: Text(
                      "FedEx, 3 days, 15\$",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Shipping Address", style: TextStyle(color: gray1)),
                  SizedBox(width: 24),
                  Expanded(
                    child: Text(
                      order.shippingAddress,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                'Order Items',
                style: Theme.of(context).textTheme.titleMedium,
              ),

              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: order.items.length,
                itemBuilder: (context, index) {
                  final item = order.items[index];
                  return ItemCard(item: item);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemRow extends StatelessWidget {
  final String label;
  final String value;

  const ItemRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(color: gray1)),
        SizedBox(width: 4),
        Text(value, style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }
}

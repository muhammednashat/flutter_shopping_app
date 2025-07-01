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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Order No:", style: TextStyle(color: gray1)),
                      SizedBox(width: 4),
                      Text(
                        (order.id).substring(1, 8),
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),

                  Text(
                    (order.date.toString()).substring(0, 11),
                    style: TextStyle(color: gray1),
                  ),
                ],
              ),
              SizedBox(height: 8.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Total Amount", style: TextStyle(color: gray1)),
                      SizedBox(width: 4),
                      Text(
                        '${order.totalAmount}\$',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Quantity", style: TextStyle(color: gray1)),
                      SizedBox(width: 4),
                      Text(
                        '${order.quantity}',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Delivery Method", style: TextStyle(color: gray1)),
                  SizedBox(width: 24),
                  Expanded(
                    child: Text(
                      "FedEx, 3 days, 15\$",
                      style: Theme.of(context).textTheme.bodyLarge,
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
                      "3 Newbridge Court ,Chino Hills,CA 91709, United States",
                      style: Theme.of(context).textTheme.bodyLarge,
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

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_app/data/model/responses/orders_response.dart';
import 'package:shopping_app/routing/routes.dart';
import 'package:shopping_app/ui/core/colors/light_color.dart';

class OrderItemCard extends StatelessWidget {
  const OrderItemCard({super.key, required this.order});

  final OrdersResponse order;
  @override
  Widget build(BuildContext context) {
    final status = order.status;

    return GestureDetector(
      onTap: () {},
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                        style: Theme.of(context).textTheme.titleMedium,
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
                      Text("Quantity", style: TextStyle(color: gray1)),
                      SizedBox(width: 4),

                      Text(
                        '${order.quantity}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Total Amount", style: TextStyle(color: gray1)),
                      SizedBox(width: 4),
                      Text(
                        '${order.totalAmount}\$',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: blackColor,
                    ),
                    onPressed: () {
                      context.push(Routes.orderDetails,extra: order );
                    },

                    child: Text("Details"),
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
            ],
          ),
        ),
      ),
    );
  }
}

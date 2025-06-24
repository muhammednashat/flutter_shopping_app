import 'package:flutter/material.dart';
import 'package:shopping_app/ui/core/colors/light_color.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Check Out'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [AdressSection()],
        ),
      ),
    );
  }
}

class AdressSection extends StatelessWidget {
  const AdressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Shipping address",
          style: Theme.of(context).textTheme.titleMedium,
        ),

        Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Jan done',
                      style: Theme.of(
                        context,
                      ).textTheme.titleSmall?.copyWith(color: blackColor),
                    ),
                    Text(
                      'Change',
                      style: Theme.of(
                        context,
                      ).textTheme.titleSmall?.copyWith(color: primaryColor),
                    ),
                  ],
                ),

                SizedBox(height: 8.0),
                Text(
                  '3 Newbridge Court \nChino Hills, CA 91709, United States',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

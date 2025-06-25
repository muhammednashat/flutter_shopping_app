import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_app/routing/routes.dart';
import 'package:shopping_app/ui/core/colors/light_color.dart';
import 'package:shopping_app/ui/core/ui/custom_button.dart';
import 'package:shopping_app/utils/util.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Check Out',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 42.0),

            AdressSection(),
            SizedBox(height: 42.0),

            ItemRow(lable: "Order", value: "130\$"),
            SizedBox(height: 24.0),
            ItemRow(lable: "Delivery", value: "25\$"),
            SizedBox(height: 24.0),
            ItemRow(lable: "Summary", value: "155\$"),
            SizedBox(height: 24.0),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomElevatedButton(
                  text: "SUBMIT ORDER",
                  onPressed: () {
                    context.push(Routes.successScreen);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemRow extends StatelessWidget {
  final String lable;
  final String value;

  const ItemRow({super.key, required this.lable, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          lable,
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(color: gray1),
        ),
        Text(value, style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }
}

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Payment',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(color: blackColor),
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
        Row(
          children: [
            // Image.asset(getImagePath('image')),
            SizedBox(
              width: 50.0,
              height: 50.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Image.asset(getImagePath('image1.jpeg')),
              ),
            ),
            SizedBox(width: 8.0),
            Text(
              '**** **** **** 5127',
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(color: blackColor),
            ),
          ],
        ),

        SizedBox(height: 8.0),
      ],
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
          style: Theme.of(context).textTheme.headlineMedium,
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

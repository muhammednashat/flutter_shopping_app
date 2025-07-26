import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_app/config/dependences.dart';
import 'package:shopping_app/data/model/responses/cart_response.dart';
import 'package:shopping_app/routing/routes.dart';
import 'package:shopping_app/ui/core/colors/light_color.dart';
import 'package:shopping_app/ui/core/ui/custom_button.dart';
import 'package:shopping_app/utils/util.dart';
import 'package:shopping_app/utils/utils.dart';

class CheckOut extends ConsumerStatefulWidget {
  final CartResponse cartResponse;
  const CheckOut({super.key, required this.cartResponse});

  @override
  ConsumerState<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends ConsumerState<CheckOut> {
  late CartResponse _cartResponse;
  @override
  void initState() {
    _cartResponse = widget.cartResponse;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Check Out'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 42.0),

            AdressSection(),
            SizedBox(height: 42.0),

            ItemRow(
              lable: "Order",
              value: "${(_cartResponse.totalPrice!).toStringAsFixed(2)}\$",
            ),
            SizedBox(height: 24.0),
            ItemRow(lable: "Delivery", value: "25.0\$"),
            SizedBox(height: 24.0),
            ItemRow(
              lable: "Summary",
              value:
                  "${((_cartResponse.totalPrice!) + 25.0).toStringAsFixed(2)}\$",
            ),
            SizedBox(height: 24.0),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomElevatedButton(
                  text: "SUBMIT ORDER",
                  onPressed: () {
                    _onSubmitPressed();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onSubmitPressed() async {
    final orderRepo = ref.read(ordersRepoProvider);
    final user = await ref.read(userProvider);
    myPrint("usr id is  => ${user.id}");
    await orderRepo.submitOrder(user.id);
    context.push(Routes.successScreen);
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
        Text(lable, style: Theme.of(context).textTheme.titleMedium),
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
          style: Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontSize: 20.0),
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
                      'Mohammed Nashat',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      'Change',
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium?.copyWith(color: primaryColor),
                    ),
                  ],
                ),

                SizedBox(height: 8.0),
                Text('15 Salah Salem Street, \n Nasr City, Cairo, Egypt'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shopping_app/utils/utils.dart';

class ShippingAdressScreen extends StatefulWidget {
  const ShippingAdressScreen({super.key, required this.userId});
  final String userId;
  @override
  State<ShippingAdressScreen> createState() => _ShippingAdressScreenState();
}

class _ShippingAdressScreenState extends State<ShippingAdressScreen> {
  late String userId;

  @override
  void initState() {
    userId = widget.userId;
    myPrint(userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shipping Address')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return const ListTile(
            title: Text('123 Main St'),
            subtitle: Text('Anytown, USA 12345'),
          );
        },
      ),
    );
  }
}

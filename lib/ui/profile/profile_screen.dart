import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_app/routing/routes.dart';
import 'package:shopping_app/utils/util.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text("Meta Lab"),
              subtitle: Text("asfdsj@gmail.com"),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(70.0),
                child: Image.asset(
                  getImagePath("image.jpeg"),
                  width: 90.0,
                  height: 90.0,
                ),
              ),
            ),
            SizedBox(height: 24.0),
            ItemRow(
              title: "Shipping addresses",
              subTitle: "3 addresses",
              distination: "distination",
            ),
            ItemRow(
              title: "Payment methodes",
              subTitle: "vis **34",
              distination: "distination",
            ),
            ItemRow(
              title: "Promocodes",
              subTitle: "You have special promocodes",
              distination: "distination",
            ),
            ItemRow(
              title: "My reviews",
              subTitle: "Reviews for 4 items",
              distination: "distination",
            ),
            ItemRow(
              title: "Settings",
              subTitle: "Name, Email,...",
              distination: "distination",
            ),
            SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }
}

class ItemRow extends StatelessWidget {
  final String title;
  final String subTitle;
  final String distination;
  const ItemRow({
    super.key,
    required this.title,
    required this.subTitle,
    required this.distination,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        context.push(Routes.settings);
      },
      title: Text(title),
      subtitle: Text(subTitle),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}

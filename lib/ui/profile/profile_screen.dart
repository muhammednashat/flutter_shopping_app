import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_app/config/dependences.dart';
import 'package:shopping_app/routing/routes.dart';
import 'package:shopping_app/ui/core/colors/light_color.dart';
import 'package:shopping_app/utils/util.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final userAsync = ref.watch(userBoxCollictionProvider);
    if (userAsync is AsyncLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (userAsync is AsyncError) {
      return Center(child: Text('Error loading user'));
    }
    return Scaffold(
      appBar: AppBar(title: Text('My Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                userAsync.value!.name,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontSize: 20.0),
              ),
              subtitle: Text(userAsync.value!.email),
              leading: CircleAvatar(
                radius: 45,
                backgroundImage: AssetImage(getImagePath("image.jpeg"), ),
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
            ListTile(
              onTap: () {
                _navitateToSettingsScreen();
              },
              title: Text(
                "Settings",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Text("Name, Email,..."),
              trailing: Icon(Icons.arrow_forward_ios, color: gray1),
            ),

            SizedBox(height: 24.0),
          ],
        ),
      ),
    );
  }

  _navitateToSettingsScreen() async {
    final user = await ref.read(userBoxCollictionProvider);
    context.push(Routes.settings, extra: user);
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
        context.push(distination);
      },
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text(subTitle),
      trailing: Icon(Icons.arrow_forward_ios, color: gray1),
    );
  }
}

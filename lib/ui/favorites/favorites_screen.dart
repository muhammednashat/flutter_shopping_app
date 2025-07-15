import 'package:flutter/material.dart';
import 'package:shopping_app/ui/core/colors/light_color.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Favorites")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.favorite_border, size: 64, color: primaryColor),
            SizedBox(height: 16),
            Text(
              "No favorites yet",
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(color: primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/config/dependences.dart';
import 'package:shopping_app/ui/core/colors/light_color.dart';
import 'package:shopping_app/ui/core/ui/category_item.dart';

class CategoriesScreen extends ConsumerStatefulWidget {
  const CategoriesScreen({super.key, required this.mainCategory});

  final String mainCategory;

  @override
  ConsumerState<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends ConsumerState<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(
      categoriesByCategoryProvider(widget.mainCategory),
    );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Card(
              color: primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Text(
                      'SUMMER SALES',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium?.copyWith(color: Colors.white),
                    ),
                    Text(
                      'Up to 50% off',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          switch (categories) {
            AsyncData(:final value) => Expanded(
              child: ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  final category = value[index];
                  return CategoryItemWidget(category: category);
                },
              ),
            ),

            AsyncError(:final error) => Center(child: Text('$error')),
            _ => Center(child: CircularProgressIndicator()),
          },
        ],
      ),
    );
  }
}

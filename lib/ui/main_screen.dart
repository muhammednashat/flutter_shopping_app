import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/config/dependences.dart';
import 'package:shopping_app/ui/bag/bag_screen.dart';
import 'package:shopping_app/ui/core/colors/light_color.dart';
import 'package:shopping_app/ui/favorites/favorites_screen.dart';
import 'package:shopping_app/ui/home/home_screen.dart';
import 'package:shopping_app/ui/orders/orders_screen.dart';
import 'package:shopping_app/ui/profile/profile_screen.dart';
import 'package:shopping_app/ui/shop/shop_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    ShopScreen(),
    BagScreen(),
    OrdersScreen(),
    FavoritesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: _screens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) => setState(() => currentIndex = value),
        selectedItemColor: Colors.red,
        unselectedItemColor: gray1,
        selectedFontSize: 12,
        unselectedFontSize: 11,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: Stack(
              clipBehavior: Clip.none,
              children: [const Icon(Icons.home, size: 26)],
            ),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined, size: 26),
            label: 'Shop',
          ),

          BottomNavigationBarItem(icon: BagIcon(), label: 'Bag'),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long, size: 26),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border, size: 26),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, size: 26),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class BagIcon extends StatelessWidget {
  const BagIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return switch (ref.watch(fetchCartItemsProvider)) {
          AsyncData(:final value) => Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(Icons.shopping_cart_outlined, size: 26),
              if(value.items!.isNotEmpty)
              BadgeIcon(counter: value.items!.length),
            ],
          ),
          _ => Icon(Icons.shopping_cart_outlined, size: 26),
        };
      },
    );
  }
}

class BadgeIcon extends StatelessWidget {
  const BadgeIcon({super.key, required this.counter});
  final int counter;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: -6,
      top: -6,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
        child: Text(
          counter.toString(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

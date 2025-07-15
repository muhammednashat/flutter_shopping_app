import 'package:flutter/material.dart';
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
      body: IndexedStack(
        index: currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) => setState(() => currentIndex = value),
        selectedItemColor: Colors.red,
        unselectedItemColor: gray1,
        selectedFontSize: 12,
        unselectedFontSize: 11,
        type: BottomNavigationBarType.shifting,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 26),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined, size: 26),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined, size: 26),
            label: 'Bag',
          ),
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

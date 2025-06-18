import 'package:flutter/material.dart';
import 'package:shopping_app/ui/bag/bag_screen.dart';
import 'package:shopping_app/ui/core/colors/light_color.dart';
import 'package:shopping_app/ui/home/home_screen.dart';
import 'package:shopping_app/ui/profile/favorites_screen.dart';
import 'package:shopping_app/ui/profile/profile_screen.dart';
import 'package:shopping_app/ui/shop/shop_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  var currentIndex = 0;
   final List<Widget> _widgets = [
    HomeScreen(),
    ShopScreen(),
    BagScreen(),
    FavoritesScreen(),
    ProfileScreen(),
   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Center(child: _widgets.elementAt(currentIndex)),

      bottomNavigationBar: BottomNavigationBar(
     
    currentIndex: currentIndex,
    
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        selectedItemColor: Colors.red, // Active icon color
        unselectedItemColor: gray1, // Inactive icon color
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed, // Ensures labels are always visible
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Bag',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        
        ),
    );
  }
}
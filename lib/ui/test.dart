// import 'package:flutter/material.dart';
// import 'package:shopping_app/utils/util.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Fashion App UI',
//       theme: ThemeData(
//         primarySwatch: Colors.red,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//         fontFamily: 'Inter', // Assuming Inter font is available or imported
//       ),
//       home: const FashionHomePage(),
//     );
//   }
// }

// class FashionHomePage extends StatefulWidget {
//   const FashionHomePage({super.key});

//   @override
//   State<FashionHomePage> createState() => _FashionHomePageState();
// }

// class _FashionHomePageState extends State<FashionHomePage> {
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Top Image Section
//             Stack(
//               children: [
//                 // Background image placeholder
//                 Image.asset(
//                  getImagePath('image1.jpeg'),
//                   fit: BoxFit.cover,
//                   height: 300,
//                   width: double.infinity,
//                   errorBuilder: (context, error, stackTrace) => Container(
//                     height: 300,
//                     width: double.infinity,
//                     color: Colors.grey[200],
//                     child: const Icon(Icons.image, size: 100, color: Colors.grey),
//                   ),
//                 ),
//                 // Gradient Overlay
//                 Positioned.fill(
//                   child: Container(
//                     decoration: BoxDecoration(
//                       gradient: LinearGradient(
//                         begin: Alignment.topCenter,
//                         end: Alignment.bottomCenter,
//                         colors: [
//                           Colors.black.withOpacity(0.0),
//                           Colors.black.withOpacity(0.0),
//                           Colors.black.withOpacity(0.0),
//                           Colors.black.withOpacity(0.4),
//                           Colors.black.withOpacity(0.6),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 // Status Bar (Time and Signal)
//                 Positioned(
//                   top: MediaQuery.of(context).padding.top + 10,
//                   left: 20,
//                   right: 20,
//                   child: const Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         '9:41',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       Row(
//                         children: [
//                           Icon(Icons.wifi, color: Colors.white, size: 20),
//                           SizedBox(width: 5),
//                           Icon(Icons.signal_cellular_alt,
//                               color: Colors.white, size: 20),
//                           SizedBox(width: 5),
//                           Text(
//                             '90%', // Placeholder for battery or other info
//                             style: TextStyle(color: Colors.white, fontSize: 16),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 // "Street clothes" text
//                 Positioned(
//                   bottom: 20,
//                   left: 20,
//                   child: Text(
//                     'Street clothes',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 32,
//                       fontWeight: FontWeight.bold,
//                       shadows: [
//                         Shadow(
//                           blurRadius: 5.0,
//                           color: Colors.black.withOpacity(0.5),
//                           offset: const Offset(2.0, 2.0),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),

//             // Sale Section
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     'Sale',
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     child: const Text(
//                       'View all',
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

            
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: Text(
//                 'Super summer sale',
//                 style: TextStyle(color: Colors.grey[600]),
//               ),
//             ),
//             const SizedBox(height: 10),
//             SizedBox(
//               height: 280, // Height for the horizontal list view
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 itemCount: 3, // Example product count
//                 itemBuilder: (context, index) {
//                   return ProductCard(
//                     discount: index == 0 ? '-20%' : (index == 1 ? '-15%' : '-2%'),
//                     imagePath:
//                      getImagePath('image1.jpeg'),
//                     rating: 10,
//                     brand: index == 0
//                         ? 'Dorothy Perkins'
//                         : (index == 1 ? 'Sitlly' : 'Doro'),
//                     name: index == 0
//                         ? 'Evening Dress'
//                         : (index == 1 ? 'Sport Dress' : 'Sport Jacket'),
//                     originalPrice:
//                     index == 0 ? 15 : (index == 1 ? 22 : 14),
//                     salePrice: index == 0 ? 12 : (index == 1 ? 19 : 11),
//                   );
//                 },
//               ),
//             ),

//             const SizedBox(height: 30),

//             // New Section
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     'New',
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     child: const Text(
//                       'View all',
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: Text(
//                 'You\'ve never seen it before !',
//                 style: TextStyle(color: Colors.grey[600]),
//               ),
//             ),
//             const SizedBox(height: 10),
//             SizedBox(
//               height: 280, // Height for the horizontal list view
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 itemCount: 3, // Example new product count
//                 itemBuilder: (context, index) {
//                   return ProductCard(
//                     discount: 'NEW',
//                     imagePath:
//                      getImagePath('image1.jpeg'),
//                     rating: 0, // No rating for new items
//                     brand: index == 0
//                         ? 'Brand A'
//                         : (index == 1 ? 'Brand B' : 'Brand C'),
//                     name: index == 0
//                         ? 'Urban Jacket'
//                         : (index == 1 ? 'Modern Pants' : 'Classic Shirt'),
//                     originalPrice: 0, // No original price for new items
//                     salePrice: index == 0 ? 30 : (index == 1 ? 25 : 20),
//                   );
//                 },
//               ),
//             ),
//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         selectedItemColor: Colors.red, // Active icon color
//         unselectedItemColor: Colors.grey, // Inactive icon color
//         showSelectedLabels: true,
//         showUnselectedLabels: true,
//         type: BottomNavigationBarType.fixed, // Ensures labels are always visible
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_bag_outlined),
//             label: 'Shop',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_cart_outlined),
//             label: 'Bag',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite_border),
//             label: 'Favorites',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person_outline),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ProductCard extends StatelessWidget {
//   final String discount;
//   final String imagePath;
//   final int rating;
//   final String brand;
//   final String name;
//   final double originalPrice;
//   final double salePrice;

//   const ProductCard({
//     super.key,
//     required this.discount,
//     required this.imagePath,
//     required this.rating,
//     required this.brand,
//     required this.name,
//     required this.originalPrice,
//     required this.salePrice,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 160,
//       margin: const EdgeInsets.only(right: 15),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Stack(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(10),
//                 child: Image.asset(
//                   imagePath,
//                   fit: BoxFit.cover,
//                   height: 180,
//                   width: 160,
//                   errorBuilder: (context, error, stackTrace) => Container(
//                     height: 180,
//                     width: 160,
//                     color: Colors.grey[200],
//                     child: const Icon(Icons.image_not_supported, size: 60, color: Colors.grey),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 10,
//                 left: 10,
//                 child: Container(
//                   padding:
//                   const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                   decoration: BoxDecoration(
//                     color: discount == 'NEW' ? Colors.black : Colors.red,
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   child: Text(
//                     discount,
//                     style: const TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 12,
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 bottom: 10,
//                 right: 10,
//                 child: Container(
//                   padding: const EdgeInsets.all(8),
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                     shape: BoxShape.circle,
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black12,
//                         blurRadius: 5,
//                         offset: Offset(0, 2),
//                       ),
//                     ],
//                   ),
//                   child: const Icon(Icons.favorite_border,
//                       color: Colors.grey, size: 20),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 8),
//           if (rating > 0)
//             Row(
//               children: [
//                 Icon(Icons.star, color: Colors.yellow[700], size: 16),
//                 Icon(Icons.star, color: Colors.yellow[700], size: 16),
//                 Icon(Icons.star, color: Colors.yellow[700], size: 16),
//                 Icon(Icons.star, color: Colors.yellow[700], size: 16),
//                 Icon(Icons.star_half, color: Colors.yellow[700], size: 16),
//                 const SizedBox(width: 4),
//                 Text('($rating)', style: TextStyle(color: Colors.grey[600])),
//               ],
//             ),
//           const SizedBox(height: 4),
//           Text(
//             brand,
//             style: TextStyle(color: Colors.grey[600], fontSize: 12),
//           ),
//           const SizedBox(height: 2),
//           Text(
//             name,
//             style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
//           ),
//           const SizedBox(height: 4),
//           Row(
//             children: [
//               if (originalPrice > 0)
//                 Text(
//                   '\$$originalPrice',
//                   style: TextStyle(
//                     color: Colors.grey[600],
//                     decoration: TextDecoration.lineThrough,
//                     fontSize: 12,
//                   ),
//                 ),
//               if (originalPrice > 0) const SizedBox(width: 5),
//               Text(
//                 '\$$salePrice',
//                 style: const TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 14,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

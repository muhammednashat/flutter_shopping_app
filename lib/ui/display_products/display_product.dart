import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shopping_app/config/dependences.dart';
import 'package:shopping_app/data/model/new_cart_item.dart';
import 'package:shopping_app/data/model/product.dart';
import 'package:shopping_app/data/repositories/cart_repo.dart';
import 'package:shopping_app/routing/routes.dart';
import 'package:shopping_app/ui/core/colors/light_color.dart';
import 'package:shopping_app/ui/core/ui/custom_button.dart';
import 'package:shopping_app/ui/core/ui/favorite_button.dart';
import 'package:shopping_app/ui/core/ui/rating_widget.dart';
import 'package:shopping_app/utils/util.dart';

class DisplayProdcut extends ConsumerStatefulWidget {
  const DisplayProdcut({super.key, required this.product});
  final Product product;
  @override
  ConsumerState<DisplayProdcut> createState() => _DisplayProdcutState();
}

class _DisplayProdcutState extends ConsumerState<DisplayProdcut> {
  late Product _product;
  late CartRepo _cartRepo;
  late String _selectedSize;

  @override
  void initState() {
    _cartRepo = ref.read(cartRepoProvider);
    _product = widget.product;
    _selectedSize = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_product.name)),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.network(
                    _product.imageUrl,
                    height: 350.0,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizeItemWidget(
                                  size: 'S',
                                  isSelected: _selectedSize == 'S',
                                  onTap: () {
                                    setState(() {
                                      _selectedSize = 'S';
                                    });
                                  },
                                ),

                                SizeItemWidget(
                                  size: 'M',
                                  isSelected: _selectedSize == 'M',
                                  onTap: () {
                                    setState(() {
                                      _selectedSize = 'M';
                                    });
                                  },
                                ),
                                SizeItemWidget(
                                  size: 'L',
                                  isSelected: _selectedSize == 'L',
                                  onTap: () {
                                    setState(() {
                                      _selectedSize = 'L';
                                    });
                                  },
                                ),
                              ],
                            ),
                            FavoriteButtonWidget(),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _product.name,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              '\$${_product.salePrice}',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                        Text(
                          _product.brandName,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          children: [
                            CustomRatingWidget(
                              initialRating: _product.rating.toDouble(),
                              numRating: _product.numRating,
                            ),
                            SizedBox(width: 4.0),
                          ],
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          _product.description,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              child: CustomElevatedButton(
                text: 'Add to cart',
                onPressed: () {
                  if (_selectedSize == "") {
                    showToast("Please select a size");
                    return;
                  }
                  addItemToCart();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<NewCartItem> _newCartItem() async {
    final user = await ref.read(userBoxCollictionProvider);
    return NewCartItem(
      userId: user.value?.id ?? "",
      productId: _product.id,
      size: _selectedSize,
      quantity: 1,
    );
  }

  Future<void> addItemToCart() async {
    final item = await _newCartItem();
    final result = await _cartRepo.insertItemIntoCart(item);
    if (result) {
      showToast("A New item has added to your cart");
      context.pop(Routes.checkOut);
    } else {
      showToast("A New item cann't add to your cart");
    }
  }
}

class SizeItemWidget extends StatelessWidget {
  final String size;
  final bool isSelected;
  final VoidCallback onTap;

  const SizeItemWidget({
    super.key,
    required this.size,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 40.0,
          height: 40.0,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 1.5,
              color: (isSelected) ? primaryColor : gray1,
            ),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Center(
            child: Text(
              size,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

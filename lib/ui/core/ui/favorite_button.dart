import 'package:flutter/material.dart';

class FavoriteButtonWidget extends StatelessWidget {
  const FavoriteButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle
      ),
      child: IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border_outlined)),
    );
  }
}
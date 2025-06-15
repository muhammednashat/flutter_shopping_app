import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shopping_app/ui/core/colors/light_color.dart';

class CustomRatingWidget extends StatelessWidget {
  const CustomRatingWidget({
    super.key,
    required this.initialRating
  });
final double initialRating;
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      unratedColor: gray3,
      itemSize: 20.0,
      ignoreGestures: true,
      initialRating: initialRating,
      minRating: 0,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemBuilder:
          (context, _) =>
              Icon(Icons.star, size: 5, color: Colors.amber),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}

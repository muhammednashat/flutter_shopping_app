import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shopping_app/ui/core/colors/light_color.dart';
import 'package:shopping_app/ui/core/ui/rating_widget.dart';
import 'package:shopping_app/utils/util.dart';


class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
    
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  getImagePath('image4.jpeg'),
                  width:160.0 ,
                  height: 200.0,
                  fit: BoxFit.cover,
                  
                  )),
    
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DynamicWidget(text: '-20%', backgroundColor: blackColor,),
              ),
             PositionedDirectional(
              bottom: 10,
              end: 10,
              child: Container(
                width: 40,
                height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle
              ),
              child: IconButton(onPressed: (){}, icon: Icon(
                Icons.favorite_border
               ,color: gray2
              ,size: 25,)),
             ) ),
    
    
             
              SizedBox(height: 12),
            ],
          ),
          SizedBox(height: 8.0),
          Row(
            children: [
              CustomRatingWidget(),
      
              SizedBox(width: 4.0),
              Text(
                '(10)',
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(color: gray1),
              ),
            ],
          ),
      
          SizedBox(width: 4.0),
          Text(
            'Dorothy Perkins',
            style: Theme.of(
              context,
            ).textTheme.titleSmall,
          ),
          SizedBox(width: 4.0),
          Text(
            'Evening Dress',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Row(
            children: [
              Text('152\$', style: TextStyle(
                decoration:  TextDecoration.lineThrough,
                color: gray2)),
              SizedBox(width: 4.0),
              Text(
                '12\$',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DynamicWidget extends StatelessWidget {
  const DynamicWidget({
    super.key, required this.text, required this.backgroundColor,
  });

final String text;
final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
    padding: EdgeInsets.all(4),
     
      child: Text(text , style: TextStyle(color: Colors.white),),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: backgroundColor),
    );
  }
}


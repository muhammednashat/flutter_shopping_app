
import 'package:flutter/material.dart';
import 'package:shopping_app/ui/core/colors/light_color.dart';

class LineAtBottom extends StatelessWidget {
  const LineAtBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
       alignment: Alignment.bottomCenter,
       child: SizedBox(
         height: 5.0,
         width: 100.0,
         child: Container(
           decoration: BoxDecoration(
             color: blackColor,
             borderRadius: BorderRadius.circular(8)
           ),
           
         ),
       ),
      ),
    );
  }
}


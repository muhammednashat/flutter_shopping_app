import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {

  final double? width;
  final String text;
  final VoidCallback onPressed;
  
  const CustomElevatedButton({
    super.key,this.width, required this.text, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 48.0,
        width: width ?? double.infinity,
        child: ElevatedButton(onPressed: onPressed, child:Text(text)
               ,
        ),
      ),
    );
  }
}
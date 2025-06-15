import 'package:flutter/material.dart';
import 'package:shopping_app/data/model/product.dart';
import 'package:shopping_app/ui/core/ui/custom_button.dart';

class DisplayProdcut extends StatefulWidget {
  const DisplayProdcut({super.key,  required this.product});


  final Product product;

  @override
  State<DisplayProdcut> createState() => _DisplayProdcutState();
}


class _DisplayProdcutState extends State<DisplayProdcut> {

late Product _product;
@override
  void initState() {

    _product = widget.product;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
         _product.name,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Column(
        
        children: [
        Expanded(child: SingleChildScrollView(
          child: Column(
            
            children: [
              Image.network(_product.imageUrl,
              height: 350.0,
              width: double.infinity,
              fit: BoxFit.fill,
              ),

              
            ],
          ),
        ))
        ,  Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              child: CustomElevatedButton(text: 'Add to cart', onPressed: (){}),
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

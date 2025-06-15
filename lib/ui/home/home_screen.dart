import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopping_app/config/dependences.dart';
import 'package:shopping_app/data/model/product.dart';
import 'package:shopping_app/ui/home/section.dart';
import 'package:shopping_app/utils/util.dart';
import 'package:shopping_app/utils/utils.dart';

class HomeScreen extends ConsumerStatefulWidget {
  
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends ConsumerState<HomeScreen> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 150, child: PageViewWidget()),
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    NewProductsWidget(),                   
                    SizedBox(height: 32.0),
                    SalingProductsWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

class NewProductsWidget extends ConsumerStatefulWidget {
  const NewProductsWidget({super.key});

  @override
  ConsumerState<NewProductsWidget> createState() => __NewProductsWidgetStateState();
}

class __NewProductsWidgetStateState extends ConsumerState<NewProductsWidget> {
  @override
  Widget build(BuildContext context) {
    
   final AsyncValue<List<Product>> products = ref.watch(newProductsProvider);
   switch(products){

    case AsyncData(:final value) :{
      myPrint(value.length);
     return Column(
     children: [
     SectionWidget(title: 'New', subTile: 'You\'ve never seen it before' , products:value),
    ],
    ); 
    } 
   
    case AsyncError(:final error) : return Center(child: Text(error.toString()),);
    default: return Center(child:  CircularProgressIndicator(),); 
   } 
 
  }
}


class SalingProductsWidget extends ConsumerStatefulWidget {
  const SalingProductsWidget({
    super.key,
  });

  @override
  ConsumerState<SalingProductsWidget> createState() => _SalingProductsWidgetState();
}

class _SalingProductsWidgetState extends ConsumerState<SalingProductsWidget> {
  @override
  Widget build(BuildContext context) {
   final AsyncValue<List<Product>> products = ref.watch(saleProductsProvider);
    
    switch (products) {
      case AsyncData(:final value):
      return Column(
     children: [
     SectionWidget(title: 'Sale', subTile: 'Super summer sale' , products:value),
    ],
    );       
    case AsyncError(:final error) :
    return  Center(child: Text(error.toString()),); 
      default: return Center(child: CircularProgressIndicator(),);
    }
  
  }
}



class PageViewWidget extends StatelessWidget {
  const PageViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Image.asset(getImagePath('bags.png')),
        Image.asset(getImagePath('bags.png')),
        Image.asset(getImagePath('bags.png')),
        Image.asset(getImagePath('bags.png')),
        Image.asset(getImagePath('bags.png')),
        Image.asset(getImagePath('bags.png')),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shopping_app/ui/home/section.dart';
import 'package:shopping_app/utils/util.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                    SectionWidget(title: 'Sale', subTile: 'Super summer sale'),
                    SizedBox(height: 32.0),
                    SectionWidget(title: 'New', subTile: 'You\'ve never seen it before'),
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

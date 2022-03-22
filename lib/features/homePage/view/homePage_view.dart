import 'package:flutter/material.dart';
import 'package:vbt_food_challange/product/widgets/bottom_navbar.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('HomePageView'),
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:vbt_food_challange/product/widgets/bottom_navbar.dart';

class SearchPageView extends StatelessWidget {
  const SearchPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('SearchPageView'),
      ),
      bottomNavigationBar: BottomNavbar(),
    );
  }
}

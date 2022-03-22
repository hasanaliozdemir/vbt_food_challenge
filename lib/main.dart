import 'package:flutter/material.dart';
import 'package:vbt_food_challange/features/homepage/view/homepage_view.dart';
import 'package:vbt_food_challange/product/widgets/bottom_navbar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: HomePageView(),
    );
  }
}

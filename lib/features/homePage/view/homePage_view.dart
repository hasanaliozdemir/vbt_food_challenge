import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vbt_food_challange/product/widgets/bottom_navbar.dart';

import '../../../core/init/lang/locale_keys.g.dart';

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
